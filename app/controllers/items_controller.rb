class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :seller_access_limit, only: [:edit, :update, :destroy]
  def index
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  private
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def seller_access_limit
    redirect_to root_path unless current_user.id == @item.user_id 
  end
end
