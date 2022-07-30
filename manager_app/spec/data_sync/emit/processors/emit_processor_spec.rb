require "rails_helper"
describe Emit::Processors::EventProcessor do
  let(:publisher) { double("publisher") }
  let(:adapter) { double("adapter") }

  subject { described_class.new(publisher, adapter) }

  describe "#handle_data_change_event" do
    context "when publisher and adapter provided" do
      it "should call #build_and_publish_message" do
        expect(subject).to receive(:build_and_publish_message)
        subject.handle_data_change_event({})
      end
    end

    context "when publisher not provided" do
      subject { described_class.new(nil, adapter) }
      it "should not call #build_and_publish_message" do
        expect(subject).not_to receive(:build_and_publish_message)
        expect { subject.handle_data_change_event({}) }.to raise_error(ArgumentError)
      end
    end

    context "when adapter not provided" do
      subject { described_class.new(publisher, nil) }
      it "should not call #build_and_publish_message" do
        expect(subject).not_to receive(:build_and_publish_message)
        expect { subject.handle_data_change_event({}) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#build_and_publish_message" do
    context "when publisher and adapter provided" do
      it "should call #publish event" do
        expect(adapter).to receive(:adapt)
        expect(publisher).to receive(:publish)
        subject.build_and_publish_message({})
      end
    end
  end
end
