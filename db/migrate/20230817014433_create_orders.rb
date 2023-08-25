class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :total_price, null: false
      t.integer :shipping_fee , null: false
      t.integer :payment_method, null: false, default: 0
      t.string :postal_code, null: false
      t.string :shipping_address, null: false
      t.string :name, null: false
      t.integer :transaction_status, null: false, default: 0

      t.timestamps
    end
  end
end
