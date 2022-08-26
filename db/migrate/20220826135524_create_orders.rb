class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.date :delivery_date
      t.string :product_id
      t.string :payment_option
      t.integer :amount
      t.string :order_status

      t.timestamps
    end
  end
end
