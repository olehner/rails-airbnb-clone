class ParkingSpotController < ApplicationController

  before_action :set_parking_spot, only: [:show, :edit, :update, :destroy]

  def index
    @parking_spots = ParkingSpot.all
  end

  def show

  end

  def new
    @parking_spot = ParkingSpot.new
    redirect_to #?
  end

  def create
    @parking_spot = ParkingSpot.new(parking_spot_params)
    @parking_spot.save
    redirect_to #?
  end

  def edit
  end

  def update
    @parking_spot = @parking_spot.update(parking_spot_params)
    redirect_to #?
  end

  def destroy
    @parking_spot.destroy
    redirect_to #?
  end

  private

  def set_parking_spot
    @parking_spot = ParkingSpot.find(params[:id])
  end

  def parking_spot_params
    params.require(:parking_spot).permit(:size, :price_per_day, :photo, :photo_cache)
  end

end
