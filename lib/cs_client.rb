# coding: utf-8
require 'faraday'
require 'faraday-cookie_jar'
require 'nokogiri'

require 'cs_client/version'

Dir.chdir 'lib' do
  Dir.glob('cs_client/*.rb') do |path|
    require path
  end
end

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
  end
end
