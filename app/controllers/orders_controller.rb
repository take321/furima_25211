class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_credit = OrderCredit.new
  end

  def create
    @order_credit = OrderCredit.new(order_params)
    if @order_credit.valid?
      pay_item
      @order_credit.save(current_user.id, params[:item_id])
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_credit).permit(:postal_code, :prefecture_id, :city_wards_towns, :address, :building_name, :phone, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
