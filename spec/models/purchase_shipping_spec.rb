require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '商品購入できるとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_idが1では購入できない' do
        @purchase_shipping.area_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_shipping.token = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_shipping.postal_code = '123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phoneが11桁以内の数値でないと購入できない' do
        @purchase_shipping.phone = '090123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone is invalid')
      end
      it 'user_idが空では購入できない' do
        @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
