class AddcolumnQuantity < ActiveRecord::Migration
  def up
	add_column :orders, :quantity, :integer
  end

  def down
  end
end
