ENV["RAILS_ENV"] ||= "test"
require "coveralls"
Coveralls.wear!

# Uncomment below code to see coverage in local
# require 'simplecov'
# SimpleCov.start 'rails'

require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
