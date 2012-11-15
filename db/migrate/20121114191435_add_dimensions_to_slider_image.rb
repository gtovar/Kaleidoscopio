class AddDimensionsToSliderImage < ActiveRecord::Migration
  def up
	  add_column :slider_images, :photo_width, :string
	  add_column :slider_images, :photo_height, :string
  end

  def down
	  remove_column :slider_images, :photo_width
	  remove_column :slider_images, :photo_height
  end
end
