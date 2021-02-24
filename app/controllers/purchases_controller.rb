class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_shipping = PurchaseShipping.new
    
  end
  
  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end
end

private

def purchase_params
  params.require(:purchase_shipping).permit(:postal_code, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def set_item
  @item = Item.find(params[:item_id])
end

def pay_item
  Payjp.api_key = "sk_test_7d75e96351429eb375982f92"
  Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
end
