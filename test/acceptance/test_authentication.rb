require 'support/acceptance_test'
require 'support/html_helper'

module CSClient
  class AuthenticationTest < AcceptanceTest
    include HTMLHelper

    def response
      @response ||= vcr('dashboard') { client.connection.get '/dashboard' }
    end

    def test_authentication
      assert_equal 200, response.status
      assert html(response).any?('.cs-host-info')
    end
  end
end
