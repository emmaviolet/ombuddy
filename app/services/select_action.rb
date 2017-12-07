module Ombuddy
	module Services
		class SelectAction      
			def self.call(data)
				payload = JSON.parse(data[:payload])
				button_value = payload['actions'][0]['value']

				{
					"replace_original": false,
					"text": self.message_for(button_value)
				}
			end

			private
			def self.message_for(button_value)
				if button_value == 'report'
					return "Okay, I can help you with that. I've created a report for you..."
				elsif button_value == 'guidance'
					return "Sure! What would you like to know?"
				else
					return "Hmmm, that doesn't seem to be something I know how to do. Care to give me some feedback?"
				end
			end
		end
	end
end