class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end

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
    @item_comments = ItemComment.all
    @item_comment = ItemComment.new
  end

  private

  def item_params
    params.require(:item).permit( :image, :item_title, :item_body)
  end
end
