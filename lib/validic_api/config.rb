require "dotenv/load"

module ValidicApi
  class Config
    attr_accessor :api_base, :org_id, :token, :org_url

    def initialize
      @api_base = "https://api.v2.validic.com"
      @org_id = ENV["VALIDIC_ORG_ID"]
      @token = ENV["VALIDIC_TOKEN"]
      @org_url = "#{api_base}/organizations/#{org_id}"
    end
  end
end
