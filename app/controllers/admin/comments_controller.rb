class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_lifehack_path(@comment.lifehack_id)
  end
end
