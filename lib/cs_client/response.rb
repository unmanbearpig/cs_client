module CSClient
  class Response < Delegator
    attr_reader :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def __getobj__
      http_response
    end

    # move this method somewhere?
    def authenticated?
      !authentication_error?
    end

    def authentication_error?
      status == 302 && headers['location'] =~ /\/sign_in/
    end

    def to_s
      "  > #{http_response.headers['status']} #{http_response.headers['location'] || ''}"
    end
  end
end
