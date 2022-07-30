require "rails_helper"

RSpec.describe "payment_requests/edit", type: :view do
  before(:each) do
    @payment_request = assign(:payment_request, PaymentRequest.create!(
      user_id: "abc123",
      amount: "9.99",
      currency: "USD",
      description: "MyText",
      status: 1
    ))
  end

  it "renders the edit payment_request form" do
    render

    assert_select "form[action=?][method=?]", payment_request_path(@payment_request), "post" do
      assert_select "p", /abc123/
      assert_select "p", /USD/

      assert_select "textarea[name=?]", "payment_request[description]"

      assert_select "select[name=?]", "payment_request[status]"
    end
  end
end
