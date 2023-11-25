class Admin::LifehacksController < ApplicationController
  def destroy
    lifehack = Lifehack.find(params[:id])
    lifehack.destroy
    redirect_to lifehacks_path
  end

  def index
    @lifehacks = Lifehack.page(params[:page])
  end

  def show
    @lifehack = Lifehack.find(params[:id])
    @comments = @lifehack.comments
  end
end
