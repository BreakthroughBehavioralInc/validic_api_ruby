require './lib/validic_api/client.rb'

RSpec.describe ValidicApi::Client do
  
  before do
    ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
    ValidicApi.token = ENV["VALIDIC_TOKEN"]
  end

  describe "initializing client" do
    let(:config) { ValidicApi::Config.new }

    it 'should be able to be initialized with a Config object' do
      client = ValidicApi::Client.new(config)
      expect(client.config).to eq(config)
    end
  
    it 'should config new client with standard config' do
      expect(ValidicApi::Client.new.config).to eq(ValidicApi.config)
    end
  end
end
