module ValidicApi
  class User < Resource
    extend ValidicApi::ApiOperations::User::Create
    extend ValidicApi::ApiOperations::User::Delete

    class Marketplace < User
      extend ValidicApi::ApiOperations::User::Marketplace::RefreshToken

      def self.resource_url
        "#{User.resource_url}"
      end
    end
  end
end
