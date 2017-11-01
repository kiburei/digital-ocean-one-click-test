class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def new
    @photo = Photo.new
  end

  def create
    @facility = Facility.find(photo_params[:facility_id])
    photo_params[:image].length.times do |i|
      @photo = Photo.new(image: photo_params[:image][i], facility_id: photo_params[:facility_id], hotel_id: photo_params[:hotel_id] )
      if @photo.save != true then redirect_to @facility end
    end
    respond_to do |format|
      format.html { redirect_to @facility, notice: "Photos successfully uploaded" }
    end
  end

  private

  def set_photo
    @photo = Photo,find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:hotel_id, :facility_id, :image => [])
  end

end
