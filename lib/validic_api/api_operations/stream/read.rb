module ValidicApi
  module ApiOperations
    module Stream
      module Read
        def read(stream_id)
          response = execute_request(:get, "#{resource_url}/#{stream_id}")
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
