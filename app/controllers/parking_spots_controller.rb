# Parking Spot controller for User that is not parklord, hence should only index/show

class ParkingSpotsController < ApplicationController
  before_action :set_parking_spot, only: [:show, :edit, :update, :destroy]

  def index
    @parking_spots = ParkingSpot.all

    @addresses = ParkingSpot.return_address_with_coordinates
    @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def citysearch
    @query = params.fetch(:search)
    @parking_spots = ParkingSpot.joins(:address).where(addresses: {city: @query})

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
  end

  private

  def set_parking_spot
    @parking_spot = ParkingSpot.find(params[:id])
  end

end
