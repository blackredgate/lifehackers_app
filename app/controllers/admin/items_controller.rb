class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  def index
    @items = Item.order(created_at: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @item_comments = @item.item_comments.all.order(created_at: :desc)
  end
end
