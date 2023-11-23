class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "LifeHackタグ"
      @lifehack_tags = LifehackTag.looks(params[:search], params[:word])
    elsif @range == "LifeHack"
      @lifehacks = Lifehack.looks(params[:search], params[:word])
    elsif @range == "Itemタグ"
      @item_tags = ItemTag.looks(params[:search], params[:word])
    else
      @items = Item.looks(params[:search], params[:word])
    end
  end
end
