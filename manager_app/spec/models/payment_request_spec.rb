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

  it_behaves_like "a change event observable" do
    let(:valid_attributes) { {amount: 5, currency: "USD", description: "change event observable create event"} }
    let(:new_attributes) do
      valid_attributes.merge({status: 2})
    end
    let(:non_observerable_attributes) do
      valid_attributes.merge({created_at: Time.now})
    end
    subject(:payment_request) { build(:payment_request, valid_attributes) }
  end
end
