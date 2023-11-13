class Admin::CommentsController < ApplicationController
  def destroy
    Lifehack.find(params[:id]).destroy
    redirect_to lifehack_path(params[:lifehack_id])
  end
end
