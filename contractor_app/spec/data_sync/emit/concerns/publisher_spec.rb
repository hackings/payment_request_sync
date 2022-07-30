require "rails_helper"
describe Emit::Concerns::Publisher do
  include Emit::Concerns::Publisher
  context "NotImplementedError adapt" do
    it "is valid with valid attributes" do
      expect { publish({}) }.to raise_error(NotImplementedError)
    end
  end
end
