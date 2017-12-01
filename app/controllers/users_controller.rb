class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @seats = @user.seats.all
    @reviews = @user.reviews.all
  end
end
