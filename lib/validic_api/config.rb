module ValidicApi
  class Config
    attr_accessor :api_base, :org_id, :token, :org_url

    def initialize
      @api_base = "https://api.v2.validic.com"
      @org_url = "#{api_base}/organizations"
    end
  end
end
