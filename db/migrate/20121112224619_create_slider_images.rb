class CreateSliderImages < ActiveRecord::Migration
  def change
    create_table :slider_images do |t|
      t.string :tagline
      t.text :description
      t.string :photo
      t.boolean :is_from_url
      t.string :external_photo

      t.timestamps
		end
  end
end
