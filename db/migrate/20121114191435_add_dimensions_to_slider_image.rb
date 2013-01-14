class AddDimensionsToSliderImage < ActiveRecord::Migration
  def up
	  add_column :slider_images, :simg_width, :string
	  add_column :slider_images, :simg_height, :string
  end

  def down
	  remove_column :slider_images, :simg_width
	  remove_column :slider_images, :simg_height
  end
end
