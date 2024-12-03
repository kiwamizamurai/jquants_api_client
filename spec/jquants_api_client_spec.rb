RSpec.describe JquantsApiClient do
  let(:mail_address) { "test@example.com" }
  let(:password) { "password123" }
  let(:refresh_token) { "dummy-refresh-token" }
  let(:id_token) { "dummy-id-token" }

  it "has a version number" do
    expect(JquantsApiClient::VERSION).not_to be nil
  end

  describe JquantsApiClient::Client do
    describe "#initialize" do
      context "with valid refresh_token" do
        it "creates a client instance" do
          client = JquantsApiClient::Client.new(refresh_token: refresh_token)
          expect(client).to be_a(JquantsApiClient::Client)
        end
      end

      context "with valid mail_address and password" do
        it "creates a client instance" do
          client = JquantsApiClient::Client.new(
            mail_address: mail_address,
            password: password
          )
          expect(client).to be_a(JquantsApiClient::Client)
        end
      end

      context "with invalid parameters" do
        it "raises ArgumentError without credentials" do
          expect {
            JquantsApiClient::Client.new
          }.to raise_error(ArgumentError, "Either mail_address/password or refresh_token is required.")
        end

        it "raises ArgumentError with invalid mail_address format" do
          expect {
            JquantsApiClient::Client.new(
              mail_address: "invalid-email",
              password: password
            )
          }.to raise_error(ArgumentError, "mail_address must contain '@' character.")
        end
      end
    end

    describe "#get_refresh_token" do
      let(:client) { JquantsApiClient::Client.new(mail_address: mail_address, password: password) }
      let(:auth_response) { { "refreshToken" => refresh_token } }

      before do
        allow(client).to receive(:post).and_return(
          double(body: auth_response.to_json)
        )
      end

      it "returns refresh token" do
        expect(client.get_refresh_token).to eq refresh_token
      end

      context "with invalid credentials" do
        before do
          allow(client).to receive(:post).and_raise(
            StandardError.new("Authentication failed")
          )
        end

        it "raises error" do
          expect { client.get_refresh_token }.to raise_error(StandardError)
        end
      end
    end

    describe "#get_id_token" do
      let(:client) { JquantsApiClient::Client.new(refresh_token: refresh_token) }
      let(:token_response) { { "idToken" => id_token } }

      before do
        allow(client).to receive(:post).and_return(
          double(body: token_response.to_json)
        )
      end

      it "returns id token" do
        expect(client.get_id_token).to eq id_token
      end

      context "with expired refresh token" do
        before do
          allow(client).to receive(:post).and_raise(
            StandardError.new("Token expired")
          )
        end

        it "raises error" do
          expect { client.get_id_token }.to raise_error(StandardError)
        end
      end
    end

  end

end
