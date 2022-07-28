class PaymentRequest < ApplicationRecord
  validates :amount, :currency, presence: true
end
