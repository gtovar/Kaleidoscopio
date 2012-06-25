class Addcolumntotal < ActiveRecord::Migration
  def up
	add_column :orders, :total_price, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end
