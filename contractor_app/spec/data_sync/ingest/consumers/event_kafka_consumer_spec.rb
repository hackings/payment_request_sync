require "rails_helper"
describe Ingest::Consumers::EventKafkaConsumer do
  let(:messages) { [{}, {}] }

  describe "#consume" do
    before do
      allow(subject).to receive(:messages).and_return(messages)
    end
    context "when messages available to consume" do
      it "should consume each message for ingest event" do
        expect(IngestEventService).to receive(:execute_call).exactly(messages.size).times
        subject.consume
      end
    end
  end
end
