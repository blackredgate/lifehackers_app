class Admin::ItemCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @item_comment = ItemComment.find(params[:id])
    @item_comment.destroy
    redirect_to admin_item_path(@item_comment.item_id)
  end
end
