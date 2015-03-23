require 'test_helper'

module CSClient
  class SearchPageAcceptanceTest < AcceptanceTest
    def search_request
      '/members/travelers?search_type=traveler&search_query=Saint+Petersburg%2C+Saint+Petersburg%2C+Russia&latitude=59.89444&longitude=30.264166'
    end

    def response
      @response ||= vcr { client.search_page search_request }
    end

    def test_items_count
      assert_equal 20, response.items.count
    end
  end
end
