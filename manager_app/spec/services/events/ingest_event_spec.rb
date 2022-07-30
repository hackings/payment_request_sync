require "rails_helper"
describe Events::IngestEvent do
  let(:expected_keys) {
    [
      :user_id,
      :amount,
      :currency,
      :description,
      :status
    ]
  }

  it "should have appropiate keys" do
    expect(subject.members).to match_array(expected_keys)
  end
end
