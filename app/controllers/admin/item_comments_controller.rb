class Admin::ItemCommentsController < ApplicationController
  def destroy
    Item.find(params[:id]).destroy
    redirect_to item_path(params[:item_id])
  end
end
