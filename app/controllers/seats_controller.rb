class SeatsController < ApplicationController
  before_action :set_seat, only: [:show, :destroy]

  def new
    if signed_in?
      @seat = current_user.seats.build
    else
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def create
   @seat = current_user.seats.create(create_params)
   if @seat.save
     flash[:success] = "Seat created!"
     redirect_to root_path
   else
     flash[:alert] = "I'm sorry, error occured."
     redirect_to root_path
   end
 end

  def destroy
    @seat.destroy
    flash[:success] = "Seat deleted."
    redirect_to request.referrer || root_url
  end

  private

  def set_seat
    @seat = Seat.find(params[:id])
  end

  def create_params
    params.require(:seat).permit(:id, :name, :url, :address, :price, :image, :wifi, :charge, :sms)
  end
end
