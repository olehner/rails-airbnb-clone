class UsersController < ApplicationController
  before_action :find_post, only: [:update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to #?
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
    @user = User.find(params[:id])
  end
end
