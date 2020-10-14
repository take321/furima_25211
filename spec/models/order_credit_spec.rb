require 'rails_helper'

RSpec.describe OrderCredit, type: :model do
  before do
   @order_credit =  FactoryBot.build(:order_credit)
  end 
  describe 'shipping_addressesテーブルへの保存' do
    context 'shipping_addressesテーブルへの保存がうまくいくとき' do
      it 'すべての欄が埋まっていれば登録できる' do
        expect(@order_credit).to be_valid
      end
    end

    context 'shipping_addressesテーブルへの保存がうまくいかないとき' do
      it '郵便番号がないと登録できない' do
        @order_credit.postal_code = ""
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「３文字ハイフン４文字」と入力されていなければ登録できない' do
        @order_credit.postal_code = 1234-123
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県がプルダウンから選ばれていないと登録できない' do
        @order_credit.prefecture_id = 1
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村がないと登録できない' do
        @order_credit.city_wards_towns = ""
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("City wards towns can't be blank")
      end
      it '番地がないと登録できない' do
        @order_credit.address = ""
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと登録できない' do
        @order_credit.phone = ""
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が10文字または11文字でないと登録できない' do
        @order_credit.phone = 123456789
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が10文字または11文字でないと登録できない' do
        @order_credit.phone = 123456789012
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Phone is invalid")
      end
      it 'トークンが取得できていないと登録できない' do
        @order_credit.token = ""
        @order_credit.valid?
        expect(@order_credit.errors.full_messages).to include("Token There is an error in the card information")
      end
    end
  end
end
