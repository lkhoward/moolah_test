$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))

require 'huzzah'
require 'watir-webdriver'
require 'pry'

puts $PROJECT_ROOT

Huzzah.configure do |config|
  config.path = "#{$PROJECT_ROOT}/lib/huzzah"
  config.default_driver = ENV['BROWSER'] ||= 'firefox'
  config.environment = ENV['AUTO_ENV'] ||= 'dev'
end

World(Huzzah::Cucumber::DSL)