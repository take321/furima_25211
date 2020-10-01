require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it '全ての欄が埋まっていれば登録できる' do
        expect(@items).to be_valid
      end
    end

    context '商品出品機能が登録できないとき' do
      it '商品名がないと登録できない' do
      end
      it '商品の説明がないと登録できない' do
      end
      it 'カテゴリーが選択されていないと登録できない' do
      end
      it 'カテゴリーは選択するプルダウンが初期状態だと登録できない' do
      end
      it '商品の状態について選択されていないと登録できない' do
      end
      it '商品の状態はプルダウンが初期状態だと登録できない' do
      end
      it '配送料の負担について選択されていないと登録できない' do
      end
      it '配送料の負担はプルダウンが初期状態だと登録できない' do
      end
      it '発送元の地域について選択されていないと登録できない' do
      end
      it '発送元の地域はプルダウンが初期状態だと登録できない' do
      end
      it '発送までの日数について選択されていないと登録できない' do
      end
      it '発送までの日数はプルダウンが初期状態だと登録できない' do
      end
      it '価格がないと登録できない' do
      end
      it '画像がないと登録できない' do
      end
      it '価格が300円から1000万の間でないと登録できない' do
      end
      it '価格は半角数字でないと登録できない' do
      end
    end
  end
end