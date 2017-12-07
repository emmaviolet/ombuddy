module Ombuddy
  module Services
    class StartReportingProcess < SlackRubyBot::Commands::Base
      
    	def self.call(params)
    		channel = params["channel"]["id"]
    		client.say(channel: data.channel, text: 'okay! let us do this')
    	end
    end
  end
end