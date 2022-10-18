require "bundler/setup"
require "validic_api"
require 'dotenv'
require 'vcr'

Dotenv.load

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
  ValidicApi.token = ENV["VALIDIC_TOKEN"]
end

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('VALIDIC_ORG_ID') { ValidicApi.org_id }
  config.filter_sensitive_data('VALIDIC_TOKEN') { ValidicApi.token }
end
