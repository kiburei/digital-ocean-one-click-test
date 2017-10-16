class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @facility = Facility.find(photo_params[:facility_id])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @facility, notice: "Photo successfully uploaded" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_photo
    @photo = Photo,find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :hotel_id, :facility_id)
  end

end
