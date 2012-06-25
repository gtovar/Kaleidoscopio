class ChangeColumnPrice < ActiveRecord::Migration
  def up
	change_column :courses, :price, :integer
	change_column :orders, :total_price, :integer
  end

  def down
  end
end
