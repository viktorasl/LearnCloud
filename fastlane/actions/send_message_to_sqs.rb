require 'aws-sdk'

module Fastlane
  module Actions
    class SendMessageToSqsAction < Action
      def self.run(params)
        Actions.verify_gem!('aws-sdk')

        UI.message 'Sending message to queue'

        # Instantiate the client.
        sqs = ::Aws::SQS::Client.new

        # Get the queue's URL.
        queue_url = sqs.get_queue_url(queue_name: params[:queue_name]).queue_url

        queued_message = sqs.send_message(
          queue_url: queue_url,
          message_body: params[:message_body],
          message_attributes: params[:message_attributes]
        )

        UI.verbose "MESSAGE ID: #{queued_message.message_id}."

        UI.message 'Successfully sent message to AWS SQS queue. ✅'.green
        
        run = queued_message
      end

      def self.description
        'Send message to AWS SQS queue'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :queue_name,
            env_name: 'FL_AWS_SQS_QUEUE_NAME',
            description: 'Define the queue name in AWS SQS',
            is_string: true,
            optional: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :message_body,
            env_name: 'FL_AWS_SQS_MESSAGE_BODY',
            description: 'Define message body',
            is_string: true,
            optional: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :message_attributes,
            env_name: 'FL_AWS_SQS_MESSAGE_ATTRIBUTES',
            description: 'Define message attributes as hash',
            is_string: false,
            optional: false
          )
        ]
      end

      def self.output
        []
      end

      def self.return_value
      end

      def self.authors
        ['viktorasl']
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
