# encoding: UTF-8
require 'csv'
class SliderImagesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @slider_images = SliderImage.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @slider_image = SliderImage.find(params[:id])
    
    respond_to do |format|
      format.html 
    end
  end

  def new
    @slider_image = SliderImage.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @slider_image = SliderImage.find(params[:id])
  end

  def create
    @slider_image = SliderImage.new(params[:slider_image])

    respond_to do |format|
      if @slider_image.save
        format.html { redirect_to slider_images_path, notice: 'La imagen del slider se creó exitosamente' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @slider_image = SliderImage.find(params[:id])

    respond_to do |format|
      if @slider_image.update_attributes(params[:slider_image])
        format.html { redirect_to @slider_image, notice: 'La imagen del slider se actualizó exitosamente' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @slider_image = SliderImage.find(params[:id])
    @slider_image.destroy

    respond_to do |format|
      format.html { redirect_to slider_images_url }
    end
  end






end
