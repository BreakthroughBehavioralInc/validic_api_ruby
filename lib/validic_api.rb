# Ruby bindings
require "forwardable"

# Version
require "validic_api/version"
require "validic_api/config"
require "validic_api/api_operations/user/create"
require "validic_api/api_operations/user/marketplace/refresh_token"

module ValidicApi
  autoload :Client, "validic_api/client"
  autoload :Error, "validic_api/error"
  autoload :Object, "validic_api/object"
  autoload :Resource, "validic_api/resource"

  autoload :User, "validic_api/resources/user"

  @config = ValidicApi::Config.new

  class << self
    attr_reader :config

    extend Forwardable

    def_delegators :@config, :org_id, :org_id=
    def_delegators :@config, :token, :token=
    def_delegators :@config, :api_base, :api_base=
    def_delegators :@config, :org_url, :org_url=
  end
end
