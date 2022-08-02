module ValidicApi
  class Client
    attr_reader :config

    def initialize(config = nil)
      @config = config || ValidicApi.config
    end
  end
end
