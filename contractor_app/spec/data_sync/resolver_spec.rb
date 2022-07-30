require "rails_helper"
describe Resolver do
  context "when call #emit_event_adapter" do
    it "should return #Emit::Adapters::EventAdapter" do
      expect(Resolver.emit_event_adapter).to be_a(Emit::Adapters::EventAdapter)
    end
  end

  context "when call #emit_event_publisher" do
    it "should return #Emit::Publishers::EventKafkaPublisher" do
      expect(Resolver.emit_event_publisher).to be_a(Emit::Publishers::EventKafkaPublisher)
    end
  end

  context "when call #emit_event_processor" do
    let(:publisher) { double("publisher") }
    let(:adapter) { double("adapter") }
    it "should return #Emit::Publishers::EventKafkaPublisher" do
      allow(Resolver).to receive(:emit_event_publisher).and_return(publisher)
      allow(Resolver).to receive(:emit_event_adapter).and_return(adapter)
      emit_event_processor = Resolver.emit_event_processor
      expect(emit_event_processor).to be_a(Emit::Processors::EventProcessor)
      expect(emit_event_processor.publisher).to eq(publisher)
      expect(emit_event_processor.adapter).to eq(adapter)
    end
  end

  context "when call #ingest_event_handler" do
    it "should return #Ingest::EventHandlers::EventHandler" do
      expect(Resolver.ingest_event_handler).to be_a(Ingest::EventHandlers::EventHandler)
    end
  end
end
