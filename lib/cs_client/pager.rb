require 'cs_client/html_parser'

module CSClient
  class Pager < HTMLParser
    def current_page
      pages_info[:current].to_i
    end

    def total_pages
      pages_info[:total].to_i
    end

    def next_page_link
      button 'Next'
    end

    def prev_page_link
      button 'Previous'
    end

    def first_page_link
      button 'First'
    end

    def last_page_link
      button 'Last'
    end

    private

    def button title
      return nil unless button_element(title)
      button_element(title).attr('href')
    end

    def button_element title
      doc.css("a.btn--pager[title=#{title}]").first
    end

    def pages_info
      return {} unless pager_description

      /(?<current>\d+)\s+of\s+(?<total>\d+)/
        .match(pager_description)
    end

    def pager_description
      doc.css('.pager.pager--label').first
        .try(:text).try(:strip)
    end
  end
end
