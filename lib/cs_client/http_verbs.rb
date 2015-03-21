module CSClient
  module HttpVerbs
    def post path, params = {}
      self.request :post, path, params
    end

    def get path, params = {}
      self.request :get, path, params
    end
  end
end
