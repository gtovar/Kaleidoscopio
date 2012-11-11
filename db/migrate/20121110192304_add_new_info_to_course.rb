class AddNewInfoToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :finish_time, :datetime               
    add_column :courses, :schedule_info, :string
    add_column :courses, :more_than_one_session, :boolean
    add_column :courses, :wont_be_bought, :boolean
    add_column :courses, :go_to_info, :string
  end
end
