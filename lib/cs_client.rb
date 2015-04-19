# coding: utf-8
require 'faraday'
require 'faraday-cookie_jar'
require 'nokogiri'

require 'cs_client/version'
require 'cs_client/user'
require 'cs_client/authenticated_connection'

module CSClient
  class Client
    class Options
      attr_reader :options_hash

      def initialize(options_hash)
        @options_hash = options_hash
      end

      def connection
        options_hash[:connection] ||
          AuthenticatedConnection.new(user)
      end

      def user
        options_hash[:user] ||
          User.new(options_hash[:username], options_hash[:password])
      end
    end

    attr_reader :options

    def initialize(options_hash)
      @options = Options.new options_hash
    end

    def user
      @user ||= options.user
    end

    def connection
      @connection ||= options.connection
    end

    def search_page path
      SearchPage.fetch path, via: connection
    end
  end
end
