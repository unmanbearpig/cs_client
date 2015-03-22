module CSClient
  class HTMLParser
    def initialize(body_or_element)
      @body_or_element = body_or_element
    end

    def doc
      if @body_or_element.kind_of?(Nokogiri::XML::Element) ||
         @body_or_element.kind_of?(Nokogiri::XML::Document)

        return @body_or_element
      end
      @doc ||= Nokogiri::HTML(@body_or_element)
    end
  end
end
