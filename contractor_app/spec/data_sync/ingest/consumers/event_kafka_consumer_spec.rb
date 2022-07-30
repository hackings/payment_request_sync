require "rails_helper"
describe Ingest::Consumers::EventKafkaConsumer do
  let(:message) { double("message") }
  let(:messages) { [message, message] }
  let(:payment_request) { double("payment_request") }

  describe "#consume" do
    before do
      allow(message).to receive(:payload).and_return({})
      allow(payment_request).to receive(:update)
      allow(PaymentRequest).to receive(:find_by).and_return(payment_request)
      allow(subject).to receive(:messages).and_return(messages)
    end
    context "when messages available to consume" do
      it "should consume each message for ingest event" do
        expect(PaymentRequest).to receive(:find_by).exactly(messages.size).times
        expect(payment_request).to receive(:update).exactly(messages.size).times
        subject.consume
      end
    end
  end
end
