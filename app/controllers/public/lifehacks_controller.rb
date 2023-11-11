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

  def edit
    @lifehack = Lifehack.find(params[:id])
  end

  def update
    @lifehack = Lifehack.find(params[:id])
    @lifehack.update(lifehack_params)
    redirect_to lifehack_path(@lifehack.id)
  end

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
    @comments = Comment.all
    @comment = Comment.new
  end

  private

  def lifehack_params
    params.require(:lifehack).permit( :image, :title, :body)
  end
end
