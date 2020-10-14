require 'rails_helper'

RSpec.describe OrderCredit, type: :model do
  before
    @order_credit =  FactoryBot.build(:order_credit)
  end 
  describe 'shipping_addressesテーブルへの保存' do
    context 'shipping_addressesテーブルへの保存がうまくいくとき' do
      it 'すべての欄が埋まっていれば登録できる' do
      end
    end

    context 'shipping_addressesテーブルへの保存がうまくいかないとき' do
      it '郵便番号がないと登録できない' do
      end
      it '郵便番号は「３文字ハイフン４文字」と入力されていなければ登録できない' do
      end
      it '都道府県が選ばれていないと選択できない' do
      end
      it '市区町村がないと登録できない' do
      end
      it '番地がないと登録できない' do
      end
      it '電話番号がないと登録できない' do
      end
      it '電話番号が11文字に満たないと登録できない' do
      end
      it 'トークンが取得できていないと登録できない' do
      end
  end
end
