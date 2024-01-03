class Public::CommentsController < ApplicationController
  before_action :guest_check, only: [:create, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:destroy]

  def create
    lifehack = Lifehack.find(params[:lifehack_id])
    comment = current_user.comments.new(comment_params)
    comment.lifehack_id = lifehack.id
    if comment.save
      redirect_to lifehack_path(lifehack)
    else
      render template: "homes/top"
    end
  end

  def destroy
    lifehack = Lifehack.find(params[:id])
    Comment.find(params[:lifehack_id]).destroy
    redirect_to lifehack_path(lifehack)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
