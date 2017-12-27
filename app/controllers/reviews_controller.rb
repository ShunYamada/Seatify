class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  def new
    @user = User.find(params[:id])
    if signed_in?
      @review = current_user.reviews_of_reviewer.build
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @review = current_user.reviews_of_reviewer.create(create_params)
    if @review.save
      flash[:success] = "レビューが登録されました！"
      redirect_to root_path
    else
      flash[:alert] = "レビューの登録に失敗しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update_attributes(create_params)
      flesh[:success] = "レビューが更新されました！"
      redirect_to root_path
    else
      flash[:alert] = "レビューの編集に失敗しました。"
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "レビューが削除されました。"
    redirect_to request.referrer || root_url
  end

  private

  def create_params
    params.require(:review).permit(:id, :rate, :content, :reviewer_id, :reviewed_id)
  end
end
