require "rails_helper"

RSpec.describe "payment_requests/show", type: :view do
  before(:each) do
    @payment_request = assign(:payment_request, PaymentRequest.create!(
      user_id: "User",
      amount: "9.99",
      currency: "Currency",
      description: "MyText",
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
