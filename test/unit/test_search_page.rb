require 'test_helper'

module CSClient
  class SearchPageTest < Minitest::Test
    def body
      File.read('test/assets/search_page.html')
    end

    def search_page
      SearchPage.new body
    end

    def test_item_count
      assert_equal 20, search_page.items.count
    end

    def test_total_results
      assert_equal 112, search_page.total_results
    end

    def test_pager_exists
      assert_kind_of Pager, search_page.pager
    end
  end
end
