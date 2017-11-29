require "bundler/setup"
require "nutritional_calculator"
require 'nutritional_calculator/food'
require 'nutritional_calculator/linkedlist'
require 'nutritional_calculator/foodgroup'
require 'nutritional_calculator/sort_methods'
require 'benchmark'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
