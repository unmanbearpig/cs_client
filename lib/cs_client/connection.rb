require 'cs_client/http_verbs'
require 'cs_client/request'

module CSClient
  class Connection
    include HttpVerbs

    class NullLogger
      def log *_args
      end
    end

    class PutsLogger
      def log message
        puts message
      end
    end

    attr_reader :http_connection, :logger

    def initialize(http_connection = nil, options = {})
      @http_connection = http_connection || default_http_connection
      @logger = options[:logger] || NullLogger.new
    end

    def request *args
      r = Request.new(*args)
      logger.log r

      response = r.submit http_connection
      logger.log response
      response
    end

    private

    def default_http_connection
      Faraday.new(url: 'https://www.couchsurfing.com') do |builder|
        builder.use :cookie_jar
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
