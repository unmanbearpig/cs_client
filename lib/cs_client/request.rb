require 'cs_client/response'

module CSClient
  class Request
    attr_reader :method, :path, :params

    def initialize(method, path, params = {})
      @method = method
      @path = path
      @params = params
    end

    def headers
      {}
    end

    def submit http_connection
      Response.new http_connection.run_request(
        method,
        path,
        encoded_params,
        headers)
    end

    def encoded_params
      URI.encode_www_form(params)
    end

    def to_s
      "#{method.to_s.upcase}: \"#{path}\" #{params}"
    end
  end
end
