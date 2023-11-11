class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "LifeHack"
      @lifehacks = Lifehack.looks(params[:search], params[:word])
    else
      @items = Item.looks(params[:search], params[:word])
    end
  end
end
