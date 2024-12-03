require 'json'
require 'date'
require 'concurrent'
require 'faraday'

module JquantsApiClient
  class Client
    JQUANTS_API_BASE = "https://api.jquants.com/v1"
    MAX_WORKERS = 5
    USER_AGENT = "jqapi-ruby"

    def initialize(refresh_token: nil, mail_address: nil, password: nil)
      @mail_address = mail_address
      @password = password
      @refresh_token = refresh_token

      if @refresh_token && !@refresh_token.empty?
        @refresh_token_expire = DateTime.now + 6
      else
        @refresh_token_expire = DateTime.now
      end

      @id_token = ""
      @id_token_expire = DateTime.now

      if ((@mail_address.nil? || @mail_address.empty?) && (@password.nil? || @password.empty?)) && (@refresh_token.nil? || @refresh_token.empty?)
        raise ArgumentError.new("Either mail_address/password or refresh_token is required.")
      end

      if @mail_address && !@mail_address.empty? && !@mail_address.include?("@")
        raise ArgumentError.new("mail_address must contain '@' character.")
      end
    end

    private

    def _base_headers
      id_token = get_id_token
      {
        "Authorization" => "Bearer #{id_token}",
        "User-Agent" => "#{USER_AGENT}/#{JquantsApiClient::VERSION} p/#{RUBY_VERSION}"
      }
    end

    def get(url, params = {})
      response = Faraday.get(url) do |req|
        req.headers = _base_headers
        req.params = params
      end

      raise "HTTP Error: #{response.status} - #{response.body}" unless response.success?

      response
    end

    def post(url, data = {})
      response = Faraday.post(url) do |req|
        req.headers = _base_headers
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end

      raise "HTTP Error: #{response.status} - #{response.body}" unless response.success?

      response
    end

    public

    def get_refresh_token(mail_address = nil, password = nil)
      if @refresh_token_expire > DateTime.now
        return @refresh_token
      end

      mail_address ||= @mail_address
      password ||= @password

      if mail_address.nil? || mail_address.empty? || password.nil? || password.empty?
        raise ArgumentError.new("mail_address/password are required")
      end

      url = "#{JQUANTS_API_BASE}/token/auth_user"
      data = {
        "mailaddress" => mail_address,
        "password" => password
      }
      response = post(url, data)
      refresh_token = JSON.parse(response.body)["refreshToken"]

      @refresh_token = refresh_token
      @refresh_token_expire = DateTime.now + 6

      @refresh_token
    end

    public

    def get_id_token(refresh_token = nil)
      return @id_token if @id_token_expire > DateTime.now

      refresh_token ||= get_refresh_token

      url = "#{JQUANTS_API_BASE}/token/auth_refresh?refreshtoken=#{refresh_token}"

      begin
        response = post(url)
        id_token = JSON.parse(response.body)["idToken"]

        @id_token = id_token
        @id_token_expire = DateTime.now + (23.0 / 24) # 23 hours

        @id_token
      rescue => e
        if refresh_token.nil? && e.response&.code == "400" && !@mail_address.empty? && !@password.empty?
          @refresh_token = ""
          @refresh_token_expire = DateTime.now
          @id_token = ""
          @id_token_expire = DateTime.now
          raise TokenAuthRefreshBadRequestException.new(e)
        end
        raise e
      end
    end

    def _get_listed_info_raw(code = "", date_yyyymmdd = "", pagination_key = "")
      url = "#{JQUANTS_API_BASE}/listed/info"
      params = {}
      params["code"] = code unless code.empty?
      params["date"] = date_yyyymmdd unless date_yyyymmdd.empty?
      params["pagination_key"] = pagination_key unless pagination_key.empty?
      response = get(url, params)
    end

    public

    def get_listed_info(code = "", date_yyyymmdd = "")
      j = _get_listed_info_raw(code, date_yyyymmdd)
      d = JSON.parse(j.body)
      data = d["info"]
      while d.key?("pagination_key")
        j = _get_listed_info_raw(code: code, date_yyyymmdd: date_yyyymmdd, pagination_key: d["pagination_key"])
        d = JSON.parse(j.body)
        data += d["info"]
      end
      df = data.map { |row| row.transform_keys(&:to_sym) }
      df.sort_by! { |row| row[:Code] }
      df
    end

    def _get_prices_daily_quotes_raw(code = "", from_yyyymmdd = "", to_yyyymmdd = "", date_yyyymmdd = "", pagination_key = "")
      url = "#{JQUANTS_API_BASE}/prices/daily_quotes"
      params = { "code" => code }
      params["date"] = date_yyyymmdd unless date_yyyymmdd.empty?
      params["from"] = from_yyyymmdd unless from_yyyymmdd.empty?
      params["to"] = to_yyyymmdd unless to_yyyymmdd.empty?
      params["pagination_key"] = pagination_key unless pagination_key.empty?
      response = get(url, params)
    end

    public

    def get_prices_daily_quotes(code = "", from_yyyymmdd = "", to_yyyymmdd = "", date_yyyymmdd = "")
      j = _get_prices_daily_quotes_raw(code, from_yyyymmdd, to_yyyymmdd, date_yyyymmdd)
      d = JSON.parse(j.body)
      data = d["daily_quotes"]
      while d.key?("pagination_key")
        j = _get_prices_daily_quotes_raw(code: code, from_yyyymmdd: from_yyyymmdd, to_yyyymmdd: to_yyyymmdd, date_yyyymmdd: date_yyyymmdd, pagination_key: d["pagination_key"])
        d = JSON.parse(j)
        data += d["daily_quotes"]
      end
      df = data.map { |row| row.transform_keys(&:to_sym) }
      df.sort_by! { |row| [row[:Code], row[:Date]] }
      df
    end

    def _get_fins_statements_raw(code = "", date_yyyymmdd = "", pagination_key = "")
      url = "#{JQUANTS_API_BASE}/fins/statements"
      params = { "code" => code, "date" => date_yyyymmdd }
      params["pagination_key"] = pagination_key unless pagination_key.empty?
      response = get(url, params)
    end

    public

    def get_fins_statements(code = "", date_yyyymmdd = "")
      j = _get_fins_statements_raw(code, date_yyyymmdd)
      d = JSON.parse(j.body)
      data = d["statements"]
      while d.key?("pagination_key")
        j = _get_fins_statements_raw(code: code, date_yyyymmdd: date_yyyymmdd, pagination_key: d["pagination_key"])
        d = JSON.parse(j.body)
        data += d["statements"]
      end
      df = data.map { |row| row.transform_keys(&:to_sym) }
      df.each do |row|
        row[:DisclosedDate] = Date.parse(row[:DisclosedDate])
        row[:CurrentPeriodStartDate] = Date.parse(row[:CurrentPeriodStartDate])
        row[:CurrentPeriodEndDate] = Date.parse(row[:CurrentPeriodEndDate])
        row[:CurrentFiscalYearStartDate] = Date.parse(row[:CurrentFiscalYearStartDate])
        row[:CurrentFiscalYearEndDate] = Date.parse(row[:CurrentFiscalYearEndDate])
        row[:NextFiscalYearStartDate] = Date.parse(row[:NextFiscalYearStartDate]) unless row[:NextFiscalYearStartDate].nil? || row[:NextFiscalYearStartDate].empty?
        row[:NextFiscalYearEndDate] = Date.parse(row[:NextFiscalYearEndDate]) unless row[:NextFiscalYearEndDate].nil? || row[:NextFiscalYearEndDate].empty?
      end
      df.sort_by! { |row| [row[:DisclosedDate], row[:DisclosedTime], row[:LocalCode]] }
      df
    end

  end

  class TokenAuthRefreshBadRequestException < StandardError
    def initialize(msg = "Token refresh failed")
      super
    end
  end
end
