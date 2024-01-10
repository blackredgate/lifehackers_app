class Public::ItemsController < ApplicationController
  before_action :guest_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @item = Item.new
    @item_tag = @item.item_tags.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "投稿に成功しました"
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
    @items = Item.order(created_at: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @item_comments = @item.item_comments.all.order(created_at: :desc)
    @item_comment = ItemComment.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_title, :item_body, item_tags_attributes: [:itag_name, :_destroy, :id])
  end
end
