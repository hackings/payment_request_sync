class PaymentRequest < ApplicationRecord
  enum :status, [:pending, :accepted, :rejected], default: :pending
  validates :amount, :currency, presence: true
  before_create :assign_user_id

  private

  def assign_user_id
    self.user_id = SecureRandom.uuid
  end
end
