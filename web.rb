require 'sinatra/base'
require 'json' 

module Ombuddy
	class Web < Sinatra::Base
		include SlackRubyBot::Loggable
		post '/api/slack/actions' do
      content_type :json
			Ombuddy::Services::SelectAction.call(params).to_json
		end
	end
end
