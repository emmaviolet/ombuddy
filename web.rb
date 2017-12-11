# frozen_string_literal: true

require "sinatra/base"
require "json"

module OmbuddyBot
  class Web < Sinatra::Base
    include SlackRubyBot::Loggable
    post "/api/slack/actions" do
      content_type :json
      OmbuddyBot::Services::SelectAction.call(params).to_json
    end
  end
end
