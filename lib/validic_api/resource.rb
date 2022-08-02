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
              "on its subclasses (e.g. Person)"
      end
      "#{client.config.org_url}/#{class_name.downcase}s"
    end

    def self.execute_request(method, url, params: {}, headers: {})
      params.merge!(token: client.config.token)
      headers.merge!(params)
      begin
        response = RestClient::Request.execute(method: method, url: url, headers: headers)
        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        JSON.parse(e.response)
      end
    end
  end
end
