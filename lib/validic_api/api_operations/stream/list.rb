module ValidicApi
  module ApiOperations
    module Stream
      module List
        def list
          response = execute_request(:get, resource_url)
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
