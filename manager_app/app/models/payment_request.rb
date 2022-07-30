class PaymentRequest < ApplicationRecord
  include Notifications::ChangeEventObservable
  enum :status, [:pending, :accepted, :rejected], default: :pending
  validates :amount, :currency, presence: true
end
