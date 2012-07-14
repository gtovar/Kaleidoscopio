class AddEndTimeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :end_time, :time
  end
end
