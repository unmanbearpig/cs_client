require 'test_helper'

module CSClient
  class SearchPageAcceptanceSmokeTest < AcceptanceTest
    def search_request
      '/members/travelers?search_type=traveler&search_query=Saint+Petersburg%2C+Saint+Petersburg%2C+Russia&latitude=59.89444&longitude=30.264166'
    end

    def search_page
      @search_page ||= vcr('search_page') { client.search_page search_request }
    end

    def pager
      search_page.pager
    end

    def test_items_count
      assert_equal 20, search_page.items.count
    end

    def test_pager
      assert_equal 1, pager.current_page
      assert_operator 1, :<, pager.total_pages
      assert_nil pager.prev_page_link
      assert pager.last_page_link
      assert pager.next_page_link
    end

    def test_total_results
      assert_operator 40, :<, search_page.total_results
    end

    def test_serialization
      assert_kind_of Array, search_page.to_h['items']
      assert_kind_of String, search_page.to_h['items'][4]['name']
    end
  end
end
