require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての欄が埋まっていれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@を含んでいれば登録できる" do
        @user.email = "abc@abc"
        expect(@user).to be_valid
      end
      it "passwordを半角英数字混合で6文字以上で書いていれば登録できる" do
        @user.password = "abcde1"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "family_nameをひらがな、カタカナ、漢字で書けば登録できる" do
        @user.family_name = "あア阿"
        expect(@user).to be_valid
      end
      it "first_nameをひらがな、カタカナ、漢字で書けば登録できる" do
        @user.first_name = "あア阿"
        expect(@user).to be_valid
      end
      it "family_name_kanaをカタカナで書けば登録できる" do
        @user.family_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it "first_name_kanaをカタカナで書けば登録できる" do
        @user.first_name_kana = "タナカ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
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
