class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :token
      t.references :course
      t.string :payment_status
      t.integer :total_price
      t.integer :quantity
		
      t.timestamps
    end
    add_index :orders, :course_id
  end
end
