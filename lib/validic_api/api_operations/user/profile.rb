module ValidicApi
  module ApiOperations
    module User
      module Profile
        def profile(uid)
          response = execute_request(:get, "#{resource_url}/#{uid}")
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
