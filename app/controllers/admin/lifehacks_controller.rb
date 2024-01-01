class Admin::LifehacksController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    lifehack = Lifehack.find(params[:id])
    lifehack.destroy
    redirect_to admin_lifehacks_path
  end

  def index
    @lifehacks = Lifehack.order(created_at: :desc).page(params[:page])
  end

  def show
    @lifehack = Lifehack.find(params[:id])
    @comments = @lifehack.comments.all.order(created_at: :desc)
  end
end
