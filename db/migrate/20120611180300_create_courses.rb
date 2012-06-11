class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :classname
      t.string :category
      t.text :description
      t.string :photo
      t.string :teachername
      t.text :bioteacher
      t.string :place
      t.text :googlemap
      t.datetime :date
      t.text :requisitesstudent
      t.string :price
      t.string :linkay
      t.integer :limitclasstickets
      t.string :linkFacebook
      t.boolean :Kaleydoscopioclass
      t.string :teaser

      t.timestamps
    end
  end
end
