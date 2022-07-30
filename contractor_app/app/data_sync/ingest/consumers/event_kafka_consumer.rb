# frozen_string_literal: true

module Ingest
  module Consumers
    class EventKafkaConsumer < KafkaConsumer
      def consume
        messages.each { |message|
          pr = PaymentRequest.find_by(user_id: message[:user_id])
          pr&.update({status: message[:status]})
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
