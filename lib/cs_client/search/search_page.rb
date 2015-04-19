require 'cs_client/html_parser'
require 'cs_client/pager'
require 'cs_client/search/search_page_item'

module CSClient
  class SearchPage < HTMLParser
    def self.fetch path, via:
      new via.get(path)
    end

    def items
      doc.css('.search-results-list li.card')
        .map { |element| SearchPageItem.new element }
    end

    def total_results
      /^(\d+)\s/.match(search_details_string)[1].to_i
    end

    def pager
      Pager.new(doc.css('.pagination').first)
    end

    private

    def search_details_string
      doc.css('.search-details h1').first.text.strip
    end
  end
end
