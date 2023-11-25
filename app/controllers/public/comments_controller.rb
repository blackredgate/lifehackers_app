class Public::CommentsController < ApplicationController
   before_action :guest_check, only: [:create, :edit, :update, :destroy]
   
   def create
    lifehack = Lifehack.find(params[:lifehack_id])
    comment = current_user.comments.new(comment_params)
    comment.lifehack_id = lifehack.id
    comment.save
    redirect_to lifehack_path(lifehack)
   end

  def destroy
    Lifehack.find(params[:id]).destroy
    redirect_to lifehack_path(params[:lifehack_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
