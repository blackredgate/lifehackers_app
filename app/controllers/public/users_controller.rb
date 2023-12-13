class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def users_unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update!(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @lifehacks = @user.lifehacks
    @comments = @user.comments
    @items = @user.items
    @item_comments = @user.item_comments
    @favorites = @user.favorites
    @item_favorites = @user.item_favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
end
