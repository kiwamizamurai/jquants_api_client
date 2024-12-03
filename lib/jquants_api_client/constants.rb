module JquantsApiClient
  module Constants
    LISTED_INFO_COLUMNS = [
      "Date",
      "Code",
      "CompanyName",
      "CompanyNameEnglish",
      "Sector17Code",
      "Sector17CodeName",
      "Sector33Code",
      "Sector33CodeName",
      "ScaleCategory",
      "MarketCode",
      "MarketCodeName",
    ]

    LISTED_INFO_STANDARD_PREMIUM_COLUMNS = [
      "Date",
      "Code",
      "CompanyName",
      "CompanyNameEnglish",
      "Sector17Code",
      "Sector17CodeName",
      "Sector33Code",
      "Sector33CodeName",
      "ScaleCategory",
      "MarketCode",
      "MarketCodeName",
      "MarginCode",
    ]

    MARKET_SEGMENT_COLUMNS = [
      "MarketCode",
      "MarketCodeName",
      "MarketCodeNameEnglish",
    ]

    MARKET_SEGMENT_DATA = [
      ["0101", "プライム（内国株式）", "Prime Market (Domestic)"],
      ["0102", "スタンダード（内国株式）", "Standard Market (Domestic)"],
      ["0103", "グロース（内国株式）", "Growth Market (Domestic)"],
      ["0104", "プライム（外国株式）", "Prime Market (Foreign)"],
      ["0105", "スタンダード（外国株式）", "Standard Market (Foreign)"],
      ["0106", "グロース（外国株式）", "Growth Market (Foreign)"],
    ]

    SECTOR_17_COLUMNS = [
      "Sector17Code",
      "Sector17CodeName",
      "Sector17CodeNameEnglish",
    ]

    SECTOR_17_DATA = [
      ["1050", "素材・化学", "Materials & Chemicals"],
      ["2050", "消費財", "Consumer Goods"],
      ["3050", "健康・ヘルスケア", "Health Care"],
      ["3100", "医薬品", "Pharmaceutical"],
      ["4050", "エネルギー資源", "Energy"],
      ["5050", "建設・住宅", "Construction & Housing"],
      ["6050", "素材産業", "Basic Materials"],
      ["7050", "産業機械", "Industrial Machinery"],
      ["8050", "自動車・輸送機", "Automobiles & Transportation"],
      ["9050", "機械・電気・精密", "Machinery, Electrical & Precision Instruments"],
      ["10050", "情報通信・サービス", "IT & Services, Others"],
      ["11050", "電気機器・精密機器", "Electric Appliances & Precision Instruments"],
      ["12050", "情報・通信", "Information & Communication"],
      ["13050", "流通・小売", "Commerce & Distribution"],
      ["14050", "金融（除く銀行）", "Financials (ex Banks)"],
      ["15050", "銀行", "Banks"],
      ["16050", "不動産", "Real Estate"],
      ["17050", "運輸・物流", "Transportation & Logistics"],
    ]

    SECTOR_33_COLUMNS = [
      "Sector33Code",
      "Sector33CodeName",
      "Sector33CodeNameEnglish",
    ]

    SECTOR_33_DATA = [
      ["0050", "水産・農林業", "Fishery, Agriculture & Forestry"],
      ["1050", "鉱業", "Mining"],
      ["2050", "建設業", "Construction"],
      ["3050", "食料品", "Foods"],
      ["3100", "繊維製品", "Textiles & Apparels"],
      ["3150", "パルプ・紙", "Pulp & Paper"],
      ["3200", "化学", "Chemicals"],
      ["3250", "医薬品", "Pharmaceutical"],
      ["3300", "石油・石炭製品", "Oil & Coal Products"],
      ["3350", "ゴム製品", "Rubber Products"],
      ["3400", "ガラス・土石製品", "Glass & Ceramics Products"],
      ["3450", "鉄鋼", "Iron & Steel"],
      ["3500", "非鉄金属", "Nonferrous Metals"],
      ["3550", "金属製品", "Metal Products"],
      ["3600", "機械", "Machinery"],
      ["3650", "電気機器", "Electric Appliances"],
      ["3700", "輸送用機器", "Transportation Equipment"],
      ["3750", "精密機器", "Precision Instruments"],
      ["3800", "その他製品", "Other Products"],
      ["4050", "電気・ガス業", "Electric Power & Gas"],
      ["5050", "陸運業", "Land Transportation"],
      ["5100", "海運業", "Marine Transportation"],
      ["5150", "空運業", "Air Transportation"],
      ["5200", "倉庫・運輸関連業", "Warehousing & Harbor Transportation"],
      ["5250", "情報・通信業", "Information & Communication"],
      ["6050", "卸売業", "Wholesale Trade"],
      ["6100", "小売業", "Retail Trade"],
      ["7050", "銀行業", "Banks"],
      ["7100", "証券、商品先物取引業", "Securities & Commodities Futures"],
      ["7150", "保険業", "Insurance"],
      ["7200", "その他金融業", "Other Financing Business"],
      ["8050", "不動産業", "Real Estate"],
      ["9050", "サービス業", "Services"],
    ]

    PRICES_DAILY_QUOTES_COLUMNS = [
      "Date",
      "Code",
      "Open",
      "High",
      "Low",
      "Close",
      "Volume",
      "TurnoverValue",
      "AdjustmentFactor",
      "AdjustmentOpen",
      "AdjustmentHigh",
      "AdjustmentLow",
      "AdjustmentClose",
      "AdjustmentVolume",
    ]

    PRICES_DAILY_QUOTES_PREMIUM_COLUMNS = [
      "Date",
      "Code",
      "Open",
      "High",
      "Low",
      "Close",
      "UpperLimit",
      "LowerLimit",
      "Volume",
      "TurnoverValue",
      "AdjustmentFactor",
      "AdjustmentOpen",
      "AdjustmentHigh",
      "AdjustmentLow",
      "AdjustmentClose",
      "AdjustmentVolume",
      "MorningOpen",
      "MorningHigh",
      "MorningLow",
      "MorningClose",
      "MorningUpperLimit",
      "MorningLowerLimit",
      "MorningVolume",
      "MorningTurnoverValue",
      "MorningAdjustmentOpen",
      "MorningAdjustmentHigh",
      "MorningAdjustmentLow",
      "MorningAdjustmentClose",
      "MorningAdjustmentVolume",
      "AfternoonOpen",
      "AfternoonHigh",
      "AfternoonLow",
      "AfternoonClose",
      "AfternoonUpperLimit",
      "AfternoonLowerLimit",
      "AfternoonVolume",
      "AfternoonTurnoverValue",
      "AfternoonAdjustmentOpen",
      "AfternoonAdjustmentHigh",
      "AfternoonAdjustmentLow",
      "AfternoonAdjustmentClose",
      "AfternoonAdjustmentVolume",
    ]

    INDICES_COLUMNS = [
      "Date",
      "Code",
      "Open",
      "High",
      "Low",
      "Close",
    ]

    INDICES_TOPIX_COLUMNS = [
      "Date",
      "Open",
      "High",
      "Low",
      "Close",
    ]

    MARKETS_TRADES_SPEC = [
      "Section",
      "PublishedDate",
      "StartDate",
      "EndDate",
      "ProprietarySales",
      "ProprietaryPurchases",
      "ProprietaryTotal",
      "ProprietaryBalance",
      "BrokerageSales",
      "BrokeragePurchases",
      "BrokerageTotal",
      "BrokerageBalance",
      "TotalSales",
      "TotalPurchases",
      "TotalTotal",
      "TotalBalance",
      "IndividualsSales",
      "IndividualsPurchases",
      "IndividualsTotal",
      "IndividualsBalance",
      "ForeignersSales",
      "ForeignersPurchases",
      "ForeignersTotal",
      "ForeignersBalance",
      "SecuritiesCosSales",
      "SecuritiesCosPurchases",
      "SecuritiesCosTotal",
      "SecuritiesCosBalance",
      "InvestmentTrustsSales",
      "InvestmentTrustsPurchases",
      "InvestmentTrustsTotal",
      "InvestmentTrustsBalance",
      "BusinessCosSales",
      "BusinessCosPurchases",
      "BusinessCosTotal",
      "BusinessCosBalance",
      "OtherCosSales",
      "OtherCosPurchases",
      "OtherCosTotal",
      "OtherCosBalance",
      "InsuranceCosSales",
      "InsuranceCosPurchases",
      "InsuranceCosTotal",
      "InsuranceCosBalance",
      "CityBKsRegionalBKsEtcSales",
      "CityBKsRegionalBKsEtcPurchases",
      "CityBKsRegionalBKsEtcTotal",
      "CityBKsRegionalBKsEtcBalance",
      "TrustBanksSales",
      "TrustBanksPurchases",
      "TrustBanksTotal",
      "TrustBanksBalance",
      "OtherFinancialInstitutionsSales",
      "OtherFinancialInstitutionsPurchases",
      "OtherFinancialInstitutionsTotal",
      "OtherFinancialInstitutionsBalance",
    ]

    MARKETS_WEEKLY_MARGIN_INTEREST = [
      "Date",
      "Code",
      "ShortMarginTradeVolume",
      "LongMarginTradeVolume",
      "ShortNegotiableMarginTradeVolume",
      "LongNegotiableMarginTradeVolume",
      "ShortStandardizedMarginTradeVolume",
      "LongStandardizedMarginTradeVolume",
      "IssueType",
    ]
    module MARKET_API_SECTIONS
      TSE1ST = "TSE1st"
      TSE2ND = "TSE2nd"
      TSE_MOTHERS = "TSEMothers"
      TSE_JASDAQ = "TSEJASDAQ"
      TSE_PRIME = "TSEPrime"
      TSE_STANDARD = "TSEStandard"
      TSE_GROWTH = "TSEGrowth"
      TOKYO_NAGOYA = "TokyoNagoya"
    end
  end
end