module ValidicApi
  class Config
    attr_accessor :org_id, :token
    attr_reader :api_base, :streaming_base_url, :org_url

    def initialize
      @api_base = "https://api.v2.validic.com"
      @org_url = "#{api_base}/organizations"
      @streaming_base_url = "https://streams.v2.validic.com"
    end
  end
end
