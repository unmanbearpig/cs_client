require 'support/acceptance_test'

module CSClient
  class AuthenticationTest < AcceptanceTest
    def response
      @response ||= vcr('dashboard') { client.connection.get '/dashboard' }
    end

    def test_authentication
      assert_equal 200, response.status
      assert html(response).any?('.cs-host-info')
    end
  end
end
