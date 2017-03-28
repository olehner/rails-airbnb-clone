class ParkingSpotController < ApplicationController

  def index
    @parking_spots = ParkingSpot.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def parking_spot_params
    params.require(:parking_spot).permit(:size, :price_per_day, :photo, :photo_cache)
  end

end
