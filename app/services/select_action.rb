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
					title = ":writing_hand: You asked to create a report."
					text = "You'll need to speak to the HR team to make a formal report. Is it okay if I pass your details onto them?"
					actions = [
          {
            "name": "report_response",
            "text": "Yes",
            "type": "button",
            "value": "yes",
          },
          {
            "name": "report_response",
            "text": "No",
            "type": "button",
            "value": "no"
          }
        ]
				elsif button_value == 'guidance'
					title = ":speaking_head_in_silhouette: You asked for some advice."
					text = "I know about your HR policy and all the support options available. Is any of that helpful?"
					actions = [
          {
            "name": "guidance_response",
            "text": "Yes",
            "type": "button",
            "value": "yes",
          },
          {
            "name": "guidance_response",
            "text": "No",
            "type": "button",
            "value": "no"
          }
        ]
				else
					title = "Hmmm, that doesn't seem to be something I know how to do."
					text = "Care to give me some feedback?"
					actions = [
          {
            "name": "unknown_response",
            "text": "Yes",
            "type": "button",
            "value": "yes",
          },
          {
            "name": "unknown_response",
            "text": "No",
            "type": "button",
            "value": "no"
          }
        ]
				end

				[
					{
        		"attachment_type": "default",
        		"title": title,
        		"text": text,
        		"actions": actions
      		}
      	]
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