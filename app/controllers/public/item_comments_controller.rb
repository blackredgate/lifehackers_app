class Public::ItemCommentsController < ApplicationController
  before_action :guest_check, only: [:new, :create, :edit, :update, :destroy]
  
  def create
    item = Item.find(params[:item_id])
    item_comment = current_user.item_comments.new(item_comment_params)
    item_comment.item_id = item.id
    item_comment.save
    redirect_to item_path(item)
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:item_comment)
  end
end
