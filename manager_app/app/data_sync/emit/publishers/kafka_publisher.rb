module Emit
  module Publishers
    class KafkaPublisher
      attr_accessor :producer, :topic
      def initialize
        @producer = Karafka.producer
        @topic = "manager_actions"
      end

      def deliver_message(message:)
        producer.produce_async(
          topic: topic,
          payload: message
        )
      end
    end
  end
end
