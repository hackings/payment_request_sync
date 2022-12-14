require "rails_helper"

RSpec.describe "payment_requests/new", type: :view do
  before(:each) do
    assign(:payment_request, PaymentRequest.new(
      user_id: 1,
      amount: "9.99",
      currency: "MyString",
      description: "MyText",
      status: 0
    ))
  end

  it "renders new payment_request form" do
    render

    assert_select "form[action=?][method=?]", payment_requests_path, "post" do
      assert_select "input[name=?]", "payment_request[amount]"

      assert_select "input[name=?]", "payment_request[currency]"

      assert_select "textarea[name=?]", "payment_request[description]"
    end
  end
end
