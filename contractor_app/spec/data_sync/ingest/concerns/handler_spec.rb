require "rails_helper"
describe Ingest::Concerns::Handler do
  include Ingest::Concerns::Handler
  context "NotImplementedError adapt" do
    it "is valid with valid attributes" do
      expect { handle({}) }.to raise_error(NotImplementedError)
    end
  end
end
