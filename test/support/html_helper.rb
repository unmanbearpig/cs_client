require 'nokogiri'
require 'minitest/assertions'
require 'delegate'

module HTMLHelper
  def html object
    HTMLHelper.new object
  end

  class HTMLHelper < Delegator
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def body
      fail 'Expected response object, got nil' if object.nil?
      return object if object.kind_of? String
      return object.body if object.respond_to?(:body)
      object.to_s
    end

    def doc
      return object if object.kind_of?(Nokogiri::HTML::Document)
      @doc ||= Nokogiri::HTML(body)
    end

    def __getobj__
      doc
    end

    def any? css_selector
      doc.css(css_selector).any?
    end
  end
end
