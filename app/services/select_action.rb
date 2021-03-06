# frozen_string_literal: true

module Ombuddy
  module Services
    INTRODUCTION_TEXT = "Hi! Are you here to report something, or would you "\
                        "like some advice?"

    class SelectAction
      class << self
        def call(data)
          payload = JSON.parse(data[:payload])
          button_value = payload["actions"][0]["value"]

          {
            "text": INTRODUCTION_TEXT,
            "attachments": attachments_for(button_value)
          }
        end

        private

        def attachments_for(button_value)
          case button_value
          when "report" then attachments_for_report
          when "guidance" then attachments_for_guidance
          else attachments_for_unknown.merge(attachment_type: "default")
          end
        end

        ####################################################
        # TODO: All of the below should live in yaml files #
        ####################################################

        def attachments_for_report
          [
            {
              title:   ":writing_hand: You asked to create a report.",
              text:    "You'll need to speak to the HR team to make a "\
                         "formal report. Can I pass your details onto them?",
              actions: [
                {
                  name: "report_response",
                  text: "Yes",
                  type: "button",
                  value: "yes"
                },
                {
                  name: "report_response",
                  text: "No",
                  type: "button",
                  value: "no"
                }
              ]
            }
          ]
        end

        def attachments_for_guidance
          [
            {
              title:   ":speaking_head_in_silhouette: You asked for some "\
                         "advice.",
              text:    "I know about your HR policy and all the support "\
                         "options available. Is any of that helpful?",
              actions: [
                {
                  name: "guidance_response",
                  text: "Yes",
                  type: "select",
                  options: [
                    {
                      text: "Our policies",
                      value: "policies"
                    },
                    {
                      text: "Support options",
                      value: "support"
                    }
                  ]
                },
                {
                  name: "guidance_response",
                  text: "No",
                  type: "button",
                  value: "no"
                }
              ]
            }
          ]
        end

        def attachments_for_unknown
          [
            {
              title:   "Hmmm, that doesn't seem to be something I know how "\
                         "to do.",
              text:    "Care to give me some feedback?",
              actions: [
                {
                  name: "unknown_response",
                  text: "Yes",
                  type: "button",
                  value: "yes"
                },
                {
                  name: "unknown_response",
                  text: "No",
                  type: "button",
                  value: "no"
                }
              ]
            }
          ]
        end
      end
    end
  end
end
