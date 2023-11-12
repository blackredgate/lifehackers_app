class Admin::ItemsController < ApplicationController
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_comments = @item.comments
    @item_comment = ItemComment.new
  end
end
