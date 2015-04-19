require 'minitest/autorun'
require_relative 'html_helper'
require 'cs_client'
require 'vcr'

module CSClient
  class AcceptanceTest < Minitest::Test
    include HTMLHelper

    def client
      @client ||= Client.new username: username, password: password
    end

    def username
      ENV['CS_USERNAME']
    end

    def password
      ENV['CS_PASSWORD']
    end

    def vcr_record_mode
      (ENV['RECORD_MODE'] || :once).to_sym
    end

    def vcr(name = nil, &block)
      VCR.use_cassette(vcr_cassette_path(name),
                       record: vcr_record_mode,
                       &block)
    end

    def vcr_cassette_path name = nil
      name ? "#{self.class.name}##{name}" : location
    end
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'vcr_cassettes'
  config.hook_into :webmock
end
