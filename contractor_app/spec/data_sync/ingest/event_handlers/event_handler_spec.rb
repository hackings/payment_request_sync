require "rails_helper"
describe Ingest::EventHandlers::EventHandler do
  let(:event) { Events::IngestEvent.new({user_id: 1, status: 0}) }
  describe "#handle" do
    context "when handle event" do
      it "should call #process_event" do
        expect(subject).to receive(:process_event).with(event)
        subject.handle(event)
      end
    end
  end

  describe "#validate_event" do
    context "when validate_event" do
      it "should raise exception if event is nil" do
        expect { subject.validate_event(nil) }.to raise_error(Ingest::EventHandlers::EventHandler::NullEvent)
      end
    end
  end

  describe "#process_event" do
    let(:payment_request) { double("payment_request") }
    context "when process_event" do
      it "should update PaymentRequest" do
        expect(PaymentRequest).to receive(:find_by).with({user_id: event.user_id}).and_return(payment_request)
        expect(payment_request).to receive(:update).with({status: event.status}).and_return(true)
        subject.process_event(event)
      end
    end
  end
end
