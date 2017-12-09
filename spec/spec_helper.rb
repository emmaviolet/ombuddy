# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), ".."))

Dir[File.join("spec", "support", "**", "*.rb")].each { |f| require f }

require "ombuddy"
require "webmock/rspec"
require "slack-ruby-bot/rspec"

RSpec.configure do |config|
  config.include FixtureHelpers
end
