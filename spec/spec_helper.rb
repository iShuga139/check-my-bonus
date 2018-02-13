ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-rcov'
require 'simplecov-json'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
  SimpleCov::Formatter::JSONFormatter
]
SimpleCov.coverage_dir 'coverage'
SimpleCov.start do
  add_filter '/spec/'
end

require 'rspec'
require 'rack/test'
require_relative '../server'

RSpec.configure do |config|
  config.color = true # Be pretty
  config.filter_run :focus
  config.full_backtrace = false
  config.run_all_when_everything_filtered = true
  config.include Rack::Test::Methods
  config.expect_with :rspec do |c|
    c.syntax = %i[should expect]
  end
end
