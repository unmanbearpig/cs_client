require 'test_helper'

module CSClient
  class PagerTest < Minitest::Test
    def body
      File.read('test/assets/pagination/first_page.html')
    end

    def pager_element
      Nokogiri::HTML(body).css('.pagination').first
    end

    def pager
      Pager.new pager_element
    end

    def test_current_page
      assert_equal 1, pager.current_page
    end

    def test_total_pages
      assert_equal 6, pager.total_pages
    end

    def test_next_page_link
      assert_equal '/members/travelers/2?latitude=59.89444&longitude=30.264166&perPage=20&search_query=Saint+Petersburg%2C+Saint+Petersburg%2C+Russia&search_type=traveler',
                   pager.next_page_link
    end

    def test_prev_page_link
      assert_equal nil, pager.prev_page_link
    end

    def test_first_page_link
      assert_equal nil, pager.first_page_link
    end

    def test_last_page_link
      assert_equal '/members/travelers/6?latitude=59.89444&longitude=30.264166&perPage=20&search_query=Saint+Petersburg%2C+Saint+Petersburg%2C+Russia&search_type=traveler',
                   pager.last_page_link
    end
  end
end
