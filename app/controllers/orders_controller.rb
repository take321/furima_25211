class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :bought_back, only: [:index, :create]
  before_action :sign_in_back, only: [:index, :create]
  before_action :seller_buy_try_back, only: [:index, :create]

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

  def bought_back
    Order.all.each do |order|
      if params[:item_id].to_i == order.item_id
        redirect_to root_path
      end
    end
  end

  def sign_in_back
    redirect_to new_user_session_path unless user_signed_in?
  end

  def seller_buy_try_back
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

end
