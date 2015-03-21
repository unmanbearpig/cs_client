require 'cs_client/response'

module CSClient
  class BasicResponse < Response
    def self.url
      raise "Override me"
    end

    def self.method
      :get
    end

    def self.fetch_via connection, options = {}
      new connection.request(method, url, options)
    end
  end
end
