
class BookingsController < ApplicationController

before_action :set_booking, only: [:show, :update, :cancel, :confirm]
before_action :authenticate_account!

  def index
    @bookings = Booking.all
  end

  def show
    @parking_spot = @booking.parking_spot
    @comments = Comment.where(booking_id: @booking)
  end

  def create
    @booking = Booking.new(booking_params)

    @parking_spot = ParkingSpot.find(params[:booking][:parking_spot_id])
    @booking.parking_spot = @parking_spot

    @booking.user = current_account.user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "parking_spots/show"
    end
  end

  def update
    @booking.update(booking_update_params)
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.cancel!
    @booking.save 
    redirect_to booking_path(@booking)
  end

  def confirm
    @booking.confirm!
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_update_params
    params.require(:booking).permit(:status)
  end

end
