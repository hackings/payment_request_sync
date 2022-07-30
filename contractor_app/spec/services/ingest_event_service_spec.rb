require "rails_helper"
describe IngestEventService do
  context "when call #execute_call" do
    let(:message) { double("message") }
    let(:handler) { double("handler") }
    it "should call #handle with event" do
      allow(Resolver).to receive(:ingest_event_handler).and_return(handler)
      allow(message).to receive(:payload).and_return({})
      expect(handler).to receive(:handle)
      IngestEventService.execute_call(message)
    end
  end
end
