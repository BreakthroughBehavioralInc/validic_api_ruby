module ValidicApi
  module ApiOperations
    module Stream
      module Delete
        def delete(stream_id)
          response = execute_request(:delete, "#{resource_url}/#{stream_id}")
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
