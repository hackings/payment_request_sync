module Ingest
  module EventHandlers
    class EventHandler
      class NullEvent < StandardError; end
      include Concerns::Handler

      attr_accessor :message_builder

      def handle(event)
        validate_event(event)
        process_event(event)
      end

      def validate_event(event)
        raise NullEvent.new(event) if event.nil?
      end

      def process_event(event)
        pr = PaymentRequest.find_by(user_id: event.user_id)
        pr&.update({status: event.status})
      end
    end
  end
end
