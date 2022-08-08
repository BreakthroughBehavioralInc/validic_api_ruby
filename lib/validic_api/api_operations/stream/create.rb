module ValidicApi
  module ApiOperations
    module Stream
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
