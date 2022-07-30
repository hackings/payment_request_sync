require "rails_helper"
describe Emit::Concerns::Adapter do
  include Emit::Concerns::Adapter
  context "NotImplementedError adapt" do
    it "is valid with valid attributes" do
      expect { adapt({}) }.to raise_error(NotImplementedError)
    end
  end
end
