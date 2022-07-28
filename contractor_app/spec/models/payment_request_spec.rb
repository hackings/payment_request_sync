require "rails_helper"

RSpec.describe PaymentRequest, type: :model do
  let(:valid_attributes) { {amount: 5, currency: "USD"} }
  context "valid attributes" do
    it "is valid with valid attributes" do
      expect(PaymentRequest.new(valid_attributes)).to be_valid
    end
  end

  context "invalid attributes" do
    it "is not valid without amount" do
      expect(PaymentRequest.new(valid_attributes.except(:amount))).not_to be_valid
    end
    it "is not valid without currency" do
      expect(PaymentRequest.new(valid_attributes.except(:currency))).not_to be_valid
    end
  end

  context "user id with uuid" do
    it "is valid with valid attributes" do
      expect(PaymentRequest.create(valid_attributes).user_id).not_to be(nil)
    end
  end
end
