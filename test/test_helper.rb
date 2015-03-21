require 'simplecov'
SimpleCov.start

require 'cs_client'
require 'vcr'
require 'pry'
require 'minitest/autorun'

Dir.chdir 'test' do
  Dir.glob('support/*.rb') do |path|
    require path
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "vcr_cassettes"
  config.hook_into :webmock
end
