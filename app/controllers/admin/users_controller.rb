class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = user.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員の更新に成功しました"
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted)
  end
end
