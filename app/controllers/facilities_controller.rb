class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  # GET /facilities
  # GET /facilities.json
  def index
    @facilities = Facility.all
    @facility_layouts = ['Classroom', 'Banquet', 'Reception', 'Theatre', 'Boardroom']
    # Last x facilities to be added
    @recent = Facility.last(2).reverse
  end

  def category
    @facilities = Facility.all
    @orientation = []
    @facilities.each do |facility|
      if facility.facility_layouts.include? params[:format]
        @orientation.push(facility)
      end
      @orientation
    end
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
    @facility_layouts = ['Classroom', 'Banquet', 'Reception', 'Theatre', 'Boardroom']
  end

  # GET /facilities/1/edit
  def edit
    if @facility.hotel == current_hotel
      # allow edit
      @facility_layouts = @facility.facility_layouts.split(" ")
    else
      redirect_to @facility, notice: 'Sorry, only the owner can edit this facility :('
    end

  end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(facility_params)
    # byebug
    @facility.facility_layouts = facility_params[:facility_layouts].join(" ")
    @facility.capacity = facility_params[:capacity].join(" ")

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully added.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    if @facility.hotel == current_hotel
      @facility.destroy
      respond_to do |format|
        format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to @facility, notice: 'Sorry, only the owner can delete this facility :('
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:name, :hotel_id, :capacity => [], :facility_layouts => [])
    end
end
