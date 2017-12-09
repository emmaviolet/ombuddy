# frozen_string_literal: true

module Ombuddy
  module Commands
    INTRODUCTION_TEXT = "Hi! Are you here to report something, or would you "\
                        "like some advice?"
    ATTACHMENTS = [
      {
        fallback: "You are unable to select an option",
        callback_id: "action_selection",
        attachment_type: "default",
        actions: [
          {
            name: "action",
            text: "Create a report",
            type: "button",
            value: "report"
          },
          {
            name: "action",
            text: "Get some advice",
            type: "button",
            value: "guidance"
          }
        ]
      }
    ].freeze

    class Greet < SlackRubyBot::Commands::Base
      include SlackRubyBot::Loggable

      command "hello", "hi" do |client, data, _match|
        client.web_client.chat_postMessage(
          channel: data.channel,
          text: INTRODUCTION_TEXT,
          attachments: ATTACHMENTS
        )
      end
    end
  end
end
