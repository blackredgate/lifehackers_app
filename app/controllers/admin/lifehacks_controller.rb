class Admin::LifehacksController < ApplicationController
  def destroy
    lifehack = Lifehack.find(params[:id])
    lifehack.destroy
    redirect_to lifehacks_path
  end

  def index
    @lifehacks = Lifehack.all
  end

  def show
    @lifehack = Lifehack.find(params[:id])
    @comments = @lifehack.comments
    @comment = Comment.new
  end
end
