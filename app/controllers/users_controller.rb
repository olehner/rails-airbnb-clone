class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  def edit

  end

  def update
    @user.build_address
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

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :date_of_birth, :bio, :phone_number, :photo, :photo_cache)
  end

  def find_user
    @user = current_user
  end
end
