# frozen_string_literal: true

module Ingest
  module Consumers
    class EventKafkaConsumer < KafkaConsumer
      def consume
        messages.each { |message|
          IngestEventService.execute_call(message)
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
