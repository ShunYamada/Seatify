class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @seats = @user.seats
  end
end
