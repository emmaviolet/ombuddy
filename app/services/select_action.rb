module Ombuddy
	module Services
		INTRODUCTION_TEXT = "Hi! Are you here to report something, or would you like some advice?"

		class SelectAction    
			def self.call(data)
				payload = JSON.parse(data[:payload])
				button_value = payload['actions'][0]['value']

				{
					"text": INTRODUCTION_TEXT,
					"attachments": self.attachments_for(button_value)
				}
			end

			private
			def self.attachments_for(button_value)
				if button_value == 'report'
					text = ":writing_hand: You asked to create a report"
				elsif button_value == 'guidance'
					text = ":speaking_head_in_silhouette: You asked for some advice"
				else
					text = "Hmmm, that doesn't seem to be something I know how to do. Care to give me some feedback?"
				end

				[{
        	"attachment_type": "default",
        	"text": text
      	}]
			end


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