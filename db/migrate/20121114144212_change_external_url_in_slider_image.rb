class ChangeExternalUrlInSliderImage < ActiveRecord::Migration
  def up
	  remove_column :slider_images, :external_photo
	  add_column :slider_images, :external_url, :string 
  end

  def down
    add_column :slider_images, :external_photo, :string
    remove_column :slider_images, :external_url
  end
end
