class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
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

  def show
  end

  def edit
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
