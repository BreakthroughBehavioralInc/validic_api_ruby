require 'rest-client'

module ValidicApi
  class Resource < Object
    def self.class_name
      name.split("::")[-1]
    end

    def self.client
      @client = ValidicApi::Client.new if !@client
      @client
    end

    def self.resource_url
      if self == Resource
        raise NotImplementedError,
              "Resource is an abstract class. You should perform actions " \
              "on its subclasses (e.g. User)"
      end
      if class_name.downcase == "Stream"
        "#{client.config.streaming_base_url}/#{class_name.downcase}s"
      else
        "#{client.config.org_url}/#{client.config.org_id}/#{class_name.downcase}s"
      end
    end

    def self.execute_request(method, url, params: {}, headers: {})
      headers.merge!("Content-Type": "application/json") if [:put, :post].include?(method)
      begin
        response = RestClient::Request.execute(method: method, url: "#{url}?token=#{client.config.token}", payload: params.to_json, headers: headers)
        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        JSON.parse(e.response)
      end
    end
  end
end
