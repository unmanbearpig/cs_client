require 'minitest/autorun'
require 'uri'
require 'cs_client/url_query_params'

module CSClient
  class URLQueryParamsTest < Minitest::Test
    def query_string
      'test=1&hello=balh'
    end

    def query_hash
      { 'test' => '1', 'hello' => 'balh' }
    end

    def test_it_serializes_params
      assert_equal query_string,
                   URLQueryParams.new(query_hash).to_s
    end

    def test_it_parses_query
      assert_equal query_hash,
                   URLQueryParams.parse(query_string).to_h
    end
  end
end
