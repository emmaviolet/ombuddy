# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "dotenv"
Dotenv.load

require "ombuddy"
require "web"

Thread.abort_on_exception = true

Thread.new do
  begin
    OmbuddyBot::App.instance.run
  rescue Exception => e # rubocop:disable Lint/RescueException
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run OmbuddyBot::Web
