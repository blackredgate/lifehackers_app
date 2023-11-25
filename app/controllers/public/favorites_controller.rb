class Public::FavoritesController < ApplicationController
  before_action :guest_check, only: [:create, :destroy]
  
  def create
    lifehack = Lifehack.find(params[:lifehack_id])
    favorite = current_user.favorites.new(lifehack_id: lifehack.id)
    favorite.save
    redirect_to lifehack_path(lifehack)
  end

  def destroy
    lifehack = Lifehack.find(params[:lifehack_id])
    favorite = current_user.favorites.find_by(lifehack_id: lifehack.id)
    favorite.destroy
    redirect_to lifehack_path(lifehack)
  end
end
