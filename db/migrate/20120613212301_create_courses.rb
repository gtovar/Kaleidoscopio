class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :photo
      t.string :teacher_name
      t.text :biography_teacher
      t.string :place
      t.text :google_map
      t.datetime :date_time
      t.text :requisites_student
      t.decimal :price
      t.string :pay_link
      t.integer :limit_class_tickets
      t.string :facebook_link
      t.boolean :owned
      t.string :photo_teacher


      t.timestamps
		end
  end
end
