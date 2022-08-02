module ValidicApi
  module ApiOperations
    module User
      module Delete
        def delete(uid)
          response = execute_request(:delete, "#{resource_url}/#{uid}")
          return response if response.has_key?("errors")
          new(response)
        end
      end
    end
  end
end
