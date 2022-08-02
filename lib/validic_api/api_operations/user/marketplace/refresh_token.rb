module ValidicApi
  module ApiOperations
    module User
      module Marketplace
        module RefreshToken
          def refresh_token(uid)
            response = execute_request(:post, "#{resource_url}/#{uid}/marketplace")
            return response if response.has_key?("errors")
            new(response)
          end
        end
      end
    end
  end
end
