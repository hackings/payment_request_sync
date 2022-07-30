require "rails_helper"
describe Emit::Publishers::EventKafkaPublisher do
  context "#publish" do
    context "when message provided" do
      it "should call #deliver_message" do
        expect(subject).to receive(:deliver_message)
        subject.publish({})
      end
    end
  end
end
