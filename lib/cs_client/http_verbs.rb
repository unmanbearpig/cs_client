module CSClient
  module HttpVerbs
    def post path, params = {}
      request :post, path, params
    end

    def get path, params = {}
      request :get, path, params
    end
  end
end
