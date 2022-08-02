module ValidicApi
  module ApiOperations
    module User
      module Create
        def create(params)
          response = execute_request(:post, resource_url, params: params)
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
