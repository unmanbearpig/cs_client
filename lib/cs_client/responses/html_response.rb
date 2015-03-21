require_relative 'basic_response'

# TODO: write test, fix it:
#
# [3] pry(main)> c.connection.get '/'
# GET: "/" {}
#   > 200 OK  || ''
# GET: "users/sign_in" {}
#   > 200 OK  || ''
#  NameError: undefined local variable or method `body' for nil:CSClient::Authenticator::SignInPage
#     from /Users/ivanfedyunin/projects/ruby/cs_client/lib/cs_client/responses/html_response.rb:6:in `doc'

module CSClient
  class HTMLResponse < BasicResponse
    def doc
      @doc ||= Nokogiri.HTML(body)
    end
  end
end
