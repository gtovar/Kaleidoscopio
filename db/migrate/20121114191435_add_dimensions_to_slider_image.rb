class AddDimensionsToSliderImage < ActiveRecord::Migration
  def up
	  add_column :slider_images, :photo_width, :integer
	  add_column :slider_images, :photo_height, :integer
  end

  def down
	  remove_column :slider_images, :photo_width
	  remove_column :slider_images, :photo_height
  end
end
