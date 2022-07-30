require "rails_helper"
describe Emit::Adapters::EventAdapter do
  describe "#adapt" do
    context "when data change event provided" do
      it "should return Events::EventAdapter" do
        expect(subject.adapt({})).to be_a(Events::EmitEvent)
      end
    end
  end
end
