require_relative 'html_helper'

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

    def vcr(name = nil, &block)
      VCR.use_cassette(vcr_cassette_path(name), &block)
    end

    def vcr_cassette_path name = nil
      name ? "#{self.class.name}##{name}" : location
    end
  end
end
