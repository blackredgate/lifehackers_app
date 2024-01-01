class Public::LifehacksController < ApplicationController
  before_action :guest_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @lifehack = Lifehack.new
    @lifehack_tag = @lifehack.lifehack_tags.new
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
    @lifehacks = Lifehack.order(created_at: :desc).page(params[:page])
  end

  def show
    @lifehack = Lifehack.find(params[:id])
    @comments = @lifehack.comments.all.order(created_at: :desc)
    @comment = Comment.new
  end

  private

  def lifehack_params
    params.require(:lifehack).permit(:image, :title, :body, lifehack_tags_attributes: [:ltag_name, :_destroy, :id])
  end
end
