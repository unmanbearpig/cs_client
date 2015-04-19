# coding: utf-8

require 'cs_client/responses'
require 'cs_client/http_verbs'
require 'cs_client/authenticator'
require 'cs_client/connection'

module CSClient
  class AuthenticatedConnection
    include HttpVerbs

    attr_reader :user

    def initialize(user, connection = Connection.new)
      @user = user
      @connection = connection
    end

    def logger
      connection.logger
    end

    def request *args
      response = authenticated_request(*args)

      unless response.authenticated?
        fail "Could not authenticate with username #{user}"
      end

      response
    end

    protected

    attr_reader :connection

    def authenticated_request *args
      response = connection.request(*args)
      unless response.authenticated?
        logger.log "# We're not authenticated, logging in and retrying request."
        authenticator.log_in
        response = connection.request(*args)
      end

      response
    end

    def authenticator
      @authenticator ||= Authenticator.new connection, user
    end
  end
end
