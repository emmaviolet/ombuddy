module Ombuddy
	module Commands
		INTRODUCTION_TEXT = [
			"Hello! I'm OmBuddy, and I'm here to help. Just let me know what you need with any of the following commands:",
			"\n*guidelines*",
			"to see your company's HR guidelines and learn about your reporting options",
			"\n*report*",
			"to file a report about an HR issue",
			"\n*help*",
			"for more information about OmBuddy or alternative support options"
			].join("\n")

		class Greet < SlackRubyBot::Commands::Base
			command 'hello' do |client, data, _match|
				client.say(channel: data.channel, text: INTRODUCTION_TEXT)
			end
		end
	end
end