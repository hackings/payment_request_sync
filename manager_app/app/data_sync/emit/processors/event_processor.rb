module Emit
  module Processors
    class EventProcessor
      include Emit::Concerns::Processor

      attr_accessor :publisher, :adapter

      def initialize(publisher, adapter)
        @publisher = publisher
        @adapter = adapter
      end

      def handle_data_change_event(change_data)
        raise ArgumentError, I18n.t("data_sync.error_messages.publisher_missing") if publisher.nil?
        raise ArgumentError, I18n.t("data_sync.error_messages.adapter_missing") if adapter.nil?
        build_and_publish_message(change_data)
      end

      # Build a message using adapter and publish same using command publisher
      def build_and_publish_message(change_data)
        change_data_event = adapter.adapt(change_data)
        publisher.publish(change_data_event)
      end
    end
  end
end
