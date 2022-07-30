module Emit
  module Publishers
    class EventKafkaPublisher < KafkaPublisher
      include Emit::Concerns::Publisher

      def publish(event)
        deliver_message(message: event.to_json)
      end
    end
  end
end
