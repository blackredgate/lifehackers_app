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
    item = Item.find(params[:id])
    ItemComment.find(params[:item_id]).destroy
    redirect_to item_path(item)
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:item_comment)
  end
end
