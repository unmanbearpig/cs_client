require 'test_helper'

module CSClient
  class AuthenticationTest < AcceptanceTest
    def client
      @client ||= Client.new username: username, password: password
    end

    def response
      @response ||= vcr('dashboard') { client.connection.get '/dashboard' }
    end

    def test_authentication
      assert_equal 200, response.status
      assert html(response).any?('.profile-status')
    end
  end
end
