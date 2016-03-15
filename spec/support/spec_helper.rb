require 'huzzah'
require 'watir-webdriver'
require 'pry'

Huzzah.configure do |config|
  config.path = '/Users/lhoward/work/moolah_test/lib/huzzah'
  config.default_driver = ENV['BROWSER'] ||= 'firefox'
  config.environment = ENV['AUTO_ENV'] ||= 'dev'
end