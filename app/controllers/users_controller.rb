class UsersController < ApplicationController

  before_action :find_user


  def edit
    build_address_for_first_time_edit
    @bookings = current_user.bookings
  end
  def show
    @bookings = current_user.bookings
    @parking_spots = current_user.parking_spots
  end
  def update
    create_address_for_first_time_edit(address_params)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to #?
  end

  private

  def find_user
    @user = current_user
  end

  def build_address_for_first_time_edit
    Address.new unless @user.address
  end

  def create_address_for_first_time_edit(address_params)
    Address.create(address_params) unless @user.address
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :date_of_birth, :bio,
      :phone_number, :photo, :photo_cache, :address_attributes => address_attr)
  end

  def address_params
    user_params[:address_attributes]
  end

  def address_attr
    [:street_name, :street_number, :zip_code, :city, :country]
  end

end
