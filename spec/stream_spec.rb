require './lib/validic_api/resources/stream.rb'
require './lib/validic_api/client.rb'
require 'pry';

RSpec.describe ValidicApi::Stream, vcr: { re_record_interval: 604800 } do
  let(:params) do
    {
      name: "test_stream"
    }
  end

  before do
    ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
    ValidicApi.token = ENV["VALIDIC_TOKEN"]
  end

  describe "#create" do
    it "should create a stream" do
      stream = ValidicApi::Stream.create(params)
      expect(stream.name).to eq(params[:name])
      ValidicApi::Stream.delete(stream.id)
    end
  end

  describe "#read" do
    it "should get a stream's details" do
      stream = ValidicApi::Stream.create(params)
      stream_details = ValidicApi::Stream.read(stream.id)
      expect(stream_details.name).to eq(params[:name])
      ValidicApi::Stream.delete(stream.id)
    end
  end

  describe "#delete" do
    it "should delete a stream" do
      stream = ValidicApi::Stream.create(params)
      stream = ValidicApi::Stream.delete(stream.id)
      expect(stream.deleted_at).to_not be_nil
    end
  end

  describe "#list" do
    it "should list the available streams for an org" do
      ValidicApi::Stream.create(params)
      streams = ValidicApi::Stream.list
      expect(streams[:streams].length).to_not be(0)
    end
  end
end
