require "bundler/setup"
require "validic_api"
require 'dotenv'
require 'vcr'

Dotenv.load(".env.test")

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('VALIDIC_ORG_ID') { ENV['VALIDIC_ORG_ID'] }
  config.filter_sensitive_data('VALIDIC_TOKEN') { ENV['VALIDIC_TOKEN'] }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
