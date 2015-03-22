require 'test_helper'

module CSClient
  class BasicSearchPageItemTest < Minitest::Test
    def body
      File.read('test/assets/search_items/basic.html')
    end

    def search_item
      SearchPageItem.new body
    end

    def test_name
      assert_equal 'israel Hernandez', search_item.name
    end

    def test_link
      assert_equal '/users/1007517534/profile',
                   search_item.link
    end

    def test_thmubnail_link
      assert_equal 'https://tcdn.couchsurfing.com/RTVqSjhubTC121XWW9f_jMuFz1g=/160x160/smart/https://s3.amazonaws.com/images.couchsurfing.us/5IB1URWTF/30394016_l_171a58fe7042868f14fb9dd08ed69ba8.jpg',
                   search_item.thumbnail_link
    end

    def test_description
      assert_equal 'I would like to know this country because I believe its  a great place to travel, I would like to know the city, friendly people and make friends.',
                   search_item.description
    end

    def test_from_location
      assert_equal 'Mexico',
                   search_item.from_location
    end

    def test_visiting_location
      assert_equal 'Saint Petersburg',
                   search_item.visiting_location
    end
  end

  class LongDescriptionSearchPageItemTest < Minitest::Test
    def body
      File.read 'test/assets/search_items/long_desc.html'
    end

    def search_item
      SearchPageItem.new body
    end

    def expected_description
      <<-DESCR
      Hi :)I'm Cosimo, from Italy, and I'm going to visit Russia for the first time. I really would love to meet locals, to share stories, nice walks and a good glass of wine :) I'm really curious to discover this wonderful and interesting culture :)
      DESCR
    end

    def test_description
      assert_equal expected_description.strip,
                   search_item.description
    end
  end
end
