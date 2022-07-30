require "rails_helper"

RSpec.describe PaymentRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/payment_requests").to route_to("payment_requests#index")
    end

    it "routes to #show" do
      expect(get: "/payment_requests/1").to route_to("payment_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/payment_requests/1/edit").to route_to("payment_requests#edit", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/payment_requests/1").to route_to("payment_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/payment_requests/1").to route_to("payment_requests#update", id: "1")
    end

    it "routes to #approve via PATCH" do
      expect(patch: "/payment_requests/1/approve").to route_to("payment_requests#approve", id: "1")
    end

    it "routes to #reject via PATCH" do
      expect(patch: "/payment_requests/1/reject").to route_to("payment_requests#reject", id: "1")
    end
  end
end
