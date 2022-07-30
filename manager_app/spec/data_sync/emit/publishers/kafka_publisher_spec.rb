require "rails_helper"
describe Emit::Publishers::KafkaPublisher do
  let(:producer) { double("producer") }
  let(:topic) { "manager_actions" }
  let(:message) { "kafka message" }

  describe "#deliver_message" do
    before do
      allow(subject).to receive(:producer).and_return(producer)
    end
    context "when producer and message provided" do
      it "should call #deliver_message" do
        expect(producer).to receive(:produce_async).with({topic: topic, payload: message})
        subject.deliver_message(message: message)
      end
    end
  end
end
