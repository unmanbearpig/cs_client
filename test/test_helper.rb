require 'simplecov'
SimpleCov.start

require 'cs_client'
require 'pry'
require 'minitest/autorun'

Dir.chdir 'test' do
  Dir.glob('support/*.rb') do |path|
    require path
  end
end
