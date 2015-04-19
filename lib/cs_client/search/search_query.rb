require_relative '../url_query_params'

module CSClient
  class SearchQuery
    def initialize(params = nil)
      @params = URLQueryParams.parse params
    end
  end
end
