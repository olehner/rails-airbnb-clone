class BookingsController < ApplicationController
#######
# ToDo: show booking only for users that are connect (@booking.User and @booking.ParkingSpot.User)
#
#######

  before_action :set_booking, only: [:show, :update]
  before_action :authenticate_account!


  def index
    @bookings = Booking.all
  end

  def show
    #### to be aligned 1:1 with the parking_spot#show VIEW - code below just best guess
    @parking_spot = @booking.parking_spot
  end

  def create
    @booking = Booking.new(booking_params)

    #### using currently logged in user when creating booking (setting it to pending) to set user to booking (parker)
    @user = current_account.user
    @booking.user = @user

    if booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_bookings_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    #### possibly add permit(:user_id)
    params.require(:booking).permit(:start_date, :end_date, :parking_spot_id)
  end

end
