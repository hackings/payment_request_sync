require "rails_helper"
describe EmitEventService do
  context "when call #execute_call" do
    let(:change_data) { {} }
    let(:processor) { double("processor") }
    it "should call #handle_data_change_event with change_data" do
      allow(Resolver).to receive(:emit_event_processor).and_return(processor)
      expect(processor).to receive(:handle_data_change_event).with(change_data)
      EmitEventService.execute_call(change_data)
    end
  end
end
