class Public::LifehacksController < ApplicationController
  def new
    @lifehack = Lifehack.new
  end

  def create
    @lifehack = Lifehack.new(lifehack_params)
    @lifehack.user_id = current_user.id
    if @lifehack.save
      redirect_to lifehack_path(@lifehack.id)
    else
      render :new
    end
  end
  
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
    @comment = Comment.new
  end
  
  private
  
  def lifehack_params
    params.require(:post_image).permit( :image, :title, :body)
  end
end
