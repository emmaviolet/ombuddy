module Ombuddy
	module Commands
		INTRODUCTION_TEXT = "Hello! I'm Ombuddy. I'm here to help address your HR concerns. How can I help today?"

		ATTACHMENTS = [
        {
        	"text": "I want to...",
            "fallback": "You are unable to choose a game",
            "callback_id": "wopr_game",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
            	{
            		"name": "action",
            		"text": "Create a report",
            		"style": "danger",
            		"type": "button",
            		"value": "report",
            		"confirm": {
            			"title": "Are you sure?",
            			"text": "Wouldn't you prefer a good game of chess?",
            			"ok_text": "Yes",
            			"dismiss_text": "No"
            		}
            	},
            	{
            		"name": "action",
            		"text": "Get some advice",
            		"type": "button",
                    "value": "guidelines"
                },
                {
                    "name": "action",
                    "text": "Find out more about Ombuddy",
                    "type": "button",
                    "value": "information"
                },
            ]
        }
    ]

		class Greet < SlackRubyBot::Commands::Base
			command 'hello', 'hi' do |client, data, _match|
				client.say(channel: data.channel, text: INTRODUCTION_TEXT)
				client.web_client.chat_postMessage(channel: data.channel, attachments: ATTACHMENTS)
			end
		end
	end
end