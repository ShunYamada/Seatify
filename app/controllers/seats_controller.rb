class SeatsController < ApplicationController
  before_action :set_seat, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  def new
    @last_seat = current_user.seats.first
    if signed_in?
      @seat = current_user.seats.build
    else
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def edit
  end

  def create
   @seat = current_user.seats.create(create_params)
   if @seat.save
     flash[:success] = "席が作成されました!"
     redirect_to root_path
   else
     flash[:alert] = "すみません、エラーが発生しました!"
     redirect_to root_path
   end
 end

 def update
   if @seat.update_attributes(create_params)
     flash[:success] = "席が更新されました!"
     redirect_to root_path
   else
     flash[:alert] = "席の編集に失敗しました。"
     render 'edit'
   end
 end

  def destroy
    @seat.destroy
    flash[:success] = "席は削除されました!"
    redirect_to request.referrer || root_url
  end

  private

  def set_seat
    @seat = Seat.find(params[:id])
  end

  def create_params
    params.require(:seat).permit(:id, :name, :url, :address, :price, :image, :wifi, :charge, :sms, :close, :hour, :comment)
  end

  def correct_user
    @seat = current_user.seats.find_by(id: params[:id])
    redirect_to root_url if @seat.nil?
  end
end
