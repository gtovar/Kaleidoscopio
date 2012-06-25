class ChangeColumn < ActiveRecord::Migration
  def up
	change_column :courses, :price, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end
