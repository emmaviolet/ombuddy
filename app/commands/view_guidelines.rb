module Ombuddy
  module Commands
    class ViewGuidelines < SlackRubyBot::Commands::Base
      command 'guidelines' do |client, data, _match|
        client.say(channel: data.channel, text: 'these are guidelines')
      end
    end
  end
end