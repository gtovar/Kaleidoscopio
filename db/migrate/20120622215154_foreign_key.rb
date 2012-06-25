class ForeignKey < ActiveRecord::Migration
  def up
	add_foreign_key :orders, :courses
  end

  def down
  end
end
