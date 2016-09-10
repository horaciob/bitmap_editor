# frozen_string_literal: true
require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
  add_filter 'vendor'

  add_group 'commands', '/app/commands'
  add_group 'models', '/app/models'
end
require_relative '../app/bitmap_editor'

SimpleCov.minimum_coverage_by_file 95
SimpleCov.refuse_coverage_drop

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 3
  config.order = :random
  Kernel.srand config.seed
end
