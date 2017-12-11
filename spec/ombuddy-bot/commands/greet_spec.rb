# frozen_string_literal: false

require "spec_helper"
require "dotenv"
Dotenv.load

describe OmbuddyBot::Commands::Greet, vcr: { cassette_name: "greet" } do
  def app
    OmbuddyBot::App.new
  end

  it "responds to 'hello'" do
    expect(message: "#{SlackRubyBot.config.user} hello")
      .to respond_with_slack_message(OmbuddyBot::Commands::INTRODUCTION_TEXT)
  end
end
