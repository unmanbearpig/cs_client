# coding: utf-8
require 'cs_client/responses'

module CSClient
  class Authenticator
    attr_reader :connection, :user

    def initialize(connection, user)
      @connection = connection
      @user = user
    end

    def log_in
      response = sign_in_form.post_via connection
    end

    def sign_in_form
      SignInForm.new user, sign_in_page.authenticity_token
    end

    def sign_in_page
      SignInPage.fetch_via connection
    end

    class SignInForm
      attr_reader :user, :authenticity_token
      def initialize(user, authenticity_token)
        @user = user
        @authenticity_token = authenticity_token
      end

      def post_via connection
        connection.post post_url, post_params
      end

      def post_url
        SignInPage.url
      end

      def post_params
        { utf8: "✓",
          authenticity_token: authenticity_token,
          'user[login]' => user.username,
          'user[password]' => user.password,
          commit: 'Log In',
          'user[remember_me]' => 1 }
      end
    end

    class SignInPage < HTMLResponse
      def self.url
        'users/sign_in'
      end

      def authenticity_token
        form.css('input[name=authenticity_token]').first.attr(:value)
      end

      def form
        doc.css('form').first
      end
    end
  end
end
