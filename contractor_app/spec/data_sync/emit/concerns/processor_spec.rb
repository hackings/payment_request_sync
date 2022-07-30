require "rails_helper"
describe Emit::Concerns::Processor do
  include Emit::Concerns::Processor
  context "NotImplementedError adapt" do
    it "is valid with valid attributes" do
      expect { handle_data_change_event({}) }.to raise_error(NotImplementedError)
    end
  end
end
