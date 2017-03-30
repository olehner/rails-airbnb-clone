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
    @comments = Comment.where(booking_id: @booking)
  end

  def create
    @booking = Booking.new(booking_params)

    #### using currently logged in user when creating booking (setting it to pending) to set user to booking (parker)

  ####
  #<%= simple form post path should be -->  %>
  #to pass parking spot to booking.create
  ###
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

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    #### possibly add permit(:user_id)
    params.require(:booking).permit(:start_date, :end_date)
  end
  ####

  def booking_update_params
    params.require(:booking).permit(:status)
  end

end
