class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.string :user_id
      t.decimal :amount
      t.string :currency
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
