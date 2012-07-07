class RemoveFacebookColumnToCourses < ActiveRecord::Migration
  def up
	remove_column :courses, :facebook_link
  end

  def down
	add_column :courses, :facebook_link, :string
  end
end
