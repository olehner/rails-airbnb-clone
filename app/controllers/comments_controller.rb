class CommentsController < ApplicationController


  def new
    @booking = Booking.find(params[:booking_id])
    @comment = Comment.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.booking_id = @booking.id

    if @comment.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
