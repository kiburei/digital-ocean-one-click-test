class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy, :new_booking]

  # GET /facilities
  # GET /facilities.json
  def index
    @swiper = Facility.all
    @facility_layouts = ['U-Shape', 'Classroom', 'Theatre', 'Lawn', 'Board-Room', 'Round-Table', 'Cocktail']
    # Last x facilities to be added
  end


  def filter
    redirect_to :action => "results", :county => params[:county], :range_1 => params[:range_1], :range_2 => params[:range_2], :capacity => params[:capacity], :layout => params[:layout], :area => params[:area]
  end

  def results
    @facility_layouts = ['U-Shape', 'Classroom', 'Theatre', 'Lawn', 'Board-Room', 'Round-Table', 'Cocktail']
    filter_params = params
    range = filter_params[:range_1].to_i..filter_params[:range_2].to_i
    @filtered = []
    @facilities = Facility.all
    @facilities.each do |facility|
        if (facility.hotel.city == filter_params[:county]) || (facility.facility_layouts.include? filter_params[:layout]) || (range.include? facility.price.to_i) || (facility.capacity.split(" ").include? filter_params[:capacity]) || (facility.hotel.area == filter_params[:area])
          @filtered.push(facility)
        end
        @filtered
      end
    render :filter
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
    @facility_layouts = ['U-Shape', 'Classroom', 'Theatre', 'Lawn', 'Board-Room', 'Round-Table', 'Cocktail']
  end

  # GET /facilities/1/edit
  def edit
    if @facility.hotel == current_hotel
      # allow edit
      @facility_layouts = @facility.facility_layouts.split(" ")
      @capacity = @facility.capacity.split(" ")
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
        format.html { redirect_to new_photo_path(@facility), notice: 'Please add photo to complete.' }
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

  def new_booking
    @booking = @facility.bookings.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:name, :hotel_id, :price, :internet, :parking, :accomodation, :swimming_pool, :pa_system, :bar, :area, :capacity => [], :facility_layouts => [])
    end
end
