require_relative '../html_parser'

module CSClient
  class SearchPageItem < HTMLParser
    def name
      doc.css('h2.card__title').first.text.strip
    end

    def link
      doc.css('h2.card__title a').first.attr('href')
    end

    def thumbnail_link
      doc.css('.card__image img').first.attr('src')
    end

    def description
      doc.css('.card__description .truncation-text p')
        .first.text
    end

    def visiting_location
      locations['Visiting']
    end

    def from_location
      locations['From']
    end

    protected

    def locations
      doc.css('.card__location')
        .lazy
        .map { |element| cleanup_location element }
        .select { |location| location.count > 1 }
        .reduce({}) { |acc, (key, value)| acc[key.sub(/:$/, '')] = value; acc }
    end

    def cleanup_location element
      element.children.map(&:text).map(&:strip)
    end
  end
end
