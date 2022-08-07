require './lib/validic_api/resources/stream.rb'
require './lib/validic_api/client.rb'
require 'pry';

RSpec.describe ValidicApi::Stream, vcr: { re_record_interval: 604800 } do

  before do
    ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
    ValidicApi.token = ENV["VALIDIC_TOKEN"]
  end

  describe "#create" do
    it "should create a stream" do
      params = {name: "test_stream"}
      stream = ValidicApi::Stream.create(params)
      expect(stream.name).to eq(params[:name])
    end
  end

  describe "#read" do
  it "should get a streams details" do
    params = {name: "test_read_stream"}
    stream = ValidicApi::Stream.create(params)
    stream_details = ValidicApi::Stream.read(stream.id)
    expect(stream_details.name).to eq(params[:name])
  end
end

  describe "#delete" do
    it "should delete a stream" do
      params = {name: "delete_stream_2"}
      stream = ValidicApi::Stream.create(params)
      stream = ValidicApi::Stream.delete(stream.id)
      expect(stream.deleted_at).to_not be_nil
    end
  end
end
