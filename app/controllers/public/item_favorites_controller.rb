class Public::ItemFavoritesController < ApplicationController
  before_action :guest_check
  before_action :is_matching_login_user
  
  def create
    item = Item.find(params[:item_id])
    item_favorite = current_user.item_favorites.new(item_id: item.id)
    item_favorite.save
    redirect_to item_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    item_favorite = current_user.item_favorites.find_by(item_id: item.id)
    item_favorite.destroy
    redirect_to item_path(item)
  end
end
