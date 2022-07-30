# frozen_string_literal: true

module Ingest
  module Consumers
    class EventKafkaConsumer < KafkaConsumer
      def consume
        messages.each { |message|
          event = Events::IngestEvent.new(message.payload)
          handler = Ingest::EventHandlers::EventHandler.new
          handler.handle(event)
        }
      end

      # Run anything upon partition being revoked
      # def revoked
      # end

      # Define here any teardown things you want when Karafka server stops
      # def shutdown
      # end
    end
  end
end
