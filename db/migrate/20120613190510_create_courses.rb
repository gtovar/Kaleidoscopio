class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :photo
      t.stringg :teacher_name
      t.text :biography_teacher
      t.string :place
      t.text :google_map
      t.datetime :date_time
      t.text :requisites_student
      t.stk :price_link
      t.integer :limt_class_tickets
      t.string :Facebook_link
      t.boolean :Kaleyoscopio_class
      t.string :teaser

      t.timestamps
    end
  end
end
