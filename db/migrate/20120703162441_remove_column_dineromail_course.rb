class RemoveColumnDineromailCourse < ActiveRecord::Migration
  def up
	remove_column :courses, :pay_link
  end

  def down
	add_column :courses, :pay_link, :string
  end
end
