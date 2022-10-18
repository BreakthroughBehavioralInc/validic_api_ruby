require './lib/validic_api/resources/user.rb'
require './lib/validic_api/client.rb'
require 'pry';

RSpec.describe ValidicApi::User, vcr: { re_record_interval: 604800 } do

  before do
    ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
    ValidicApi.token = ENV["VALIDIC_TOKEN"]
  end

  let(:params) do
    {
      location: {
        timezone: "America/New_York",
        country: "US"
      }
    }
  end

  describe "#create" do
    it "should provision a user" do
      params[:uid] = "3015"
      user = ValidicApi::User.create(params)
      expect(user.uid).to eq(params[:uid])
      ValidicApi::User.delete(params[:uid])
    end
  end

  describe "#delete" do
    it "should delete a user" do
      params[:uid] = "2011"
      ValidicApi::User.create(params)
      user = ValidicApi::User.delete(params[:uid])
      expect(user.status).to eq("deleted")
    end
  end

  describe "#profile" do
    it "should get a users profile" do
      params[:uid] = "3013"
      ValidicApi::User.create(params)
      user = ValidicApi::User.profile(params[:uid])
      expect(user.uid).to eq(params[:uid])
      ValidicApi::User.delete(params[:uid])
    end
  end

  describe "marketplace#refresh_token" do
    it "should refresh a user marketplace token" do
      params[:uid] = "2012"
      ValidicApi::User.create(params)
      user = ValidicApi::User.profile(params[:uid])
      old_token = user.marketplace.token
      refreshed_marketplace = ValidicApi::User::Marketplace.refresh_token(user.uid)
      expect(refreshed_marketplace.token).to_not eq(old_token)
      ValidicApi::User.delete(params[:uid])
    end
  end
end
