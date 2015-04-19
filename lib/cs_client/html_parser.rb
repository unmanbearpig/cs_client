require 'nokogiri'
require 'active_support/json'

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
      @doc ||= Nokogiri::HTML(extract_response_body(@body_or_element))
    end

    def self.fields
      public_instance_methods - superclass.public_instance_methods
    end

    def to_h
      self.class.fields.reduce({}) do |acc, field|
        acc[field] = self.send(field)
        acc
      end.as_json
    end

    def as_json options = nil
      to_h
    end

    private

    def extract_response_body response_or_string
      if response_or_string.respond_to?(:body)
        return response_or_string.body
      else
        response_or_string
      end
    end
  end
end
