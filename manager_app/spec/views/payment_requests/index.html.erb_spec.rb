require 'rails_helper'

RSpec.describe "payment_requests/index", type: :view do
  before(:each) do
    assign(:payment_requests, [
      PaymentRequest.create!(
        user_id: "User",
        amount: "9.99",
        currency: "Currency",
        description: "MyText",
        status: 2
      ),
      PaymentRequest.create!(
        user_id: "User",
        amount: "9.99",
        currency: "Currency",
        description: "MyText",
        status: 2
      )
    ])
  end

  it "renders a list of payment_requests" do
    render
    assert_select "tr>td", text: "User".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Currency".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
