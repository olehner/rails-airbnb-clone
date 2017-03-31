# Parking Spot controller for User that is not parklord, hence should only index/show

class ParkingSpotsController < ApplicationController
  before_action :set_parking_spot, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_account!, only: [:show, :index, :search]
  def index
    @parking_spots = ParkingSpot.all

    @addresses = ParkingSpot.return_address_with_coordinates
    @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    @user = current_user
    end
  end

  def search
    @city_query = params[:city].blank? ? nil : params[:city]
    @size_query = params[:size].blank? ? nil : params[:size]

    @parking_spots = ParkingSpot.joins(:address)
    if @city_query
      @parking_spots = @parking_spots.where(addresses: {city: @city_query})
    end
    if @size_query
      @parking_spots = @parking_spots.where(size: @size_query)
    end

    @addresses = @parking_spots.return_address_with_coordinates
    @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @hash = Gmaps4rails.build_markers([@parking_spot.address]) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
    @booking = Booking.new
  end

  private

  def set_parking_spot
    @parking_spot = ParkingSpot.find(params[:id])
  end

end
