class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
