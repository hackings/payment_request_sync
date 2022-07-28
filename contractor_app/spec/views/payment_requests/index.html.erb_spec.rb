require "rails_helper"

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
    assert_select "p", /User/, count: 2
    assert_select "p", /9.99/, count: 2
    assert_select "p", /Currency/, count: 2
    assert_select "p", /MyText/, count: 2
    assert_select "p", /2/, count: 2
  end
end
