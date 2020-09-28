require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての欄が埋まっていれば登録できる" do
      end
      it "emailに@を含んでいれば登録できる" do
      end
      it "passwordを半角英数字で書いていれば登録できる" do
      end
      it "passwordを6文字以上で書いていれば登録できる" do
      end
      it "family_nameをひらがな、カタカナ、漢字で書けば登録できる" do
      end
      it "first_nameをひらがな、カタカナ、漢字で書けば登録できる" do
      end
      it "family_name_kanaをカタカナで書けば登録できる" do
      end
      it "first_name_kanaをカタカナで書けば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない"　do
      end
      it "emailが重複していた場合登録できない" do
      end
      it "emailに@を含まなかった場合登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが半角英数字混合でなかった場合登録できない" do
      end
      it "passwordが5文字以下だった場合登録できない" do
      end
      it "password_confimationが空だった場合登録できない" do
      end
      it "family_nameが空だった場合登録できない" do
      end
      it "family_nameがひらがな、カタカナ、漢字以外だった場合登録できない" do
      end
      it "first_nameが空だった場合登録できない" do
      end
      it "first_nameがひらがな、カタカナ、漢字意外だった場合登録できない" do
      end
      it "family_name_kanaが空だった場合登録できない" do
      end
      it "family_name_kanaがカタカナ以外だった場合登録できない" do
      end
      it "first_name_kanaが空だった場合登録できない" do
      end
      it "first_name_kanaがカタカナ以外だった場合登録できない" do
      end
      it "birthdayが空だった場合登録できない" do
      end
    end
  end
end
