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
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していた場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@を含まなかった場合登録できない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合でなかった場合登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが5文字以下だった場合登録できない" do
        @user.password = "aaaa1"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password_confimationが空だった場合登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "family_nameが空だった場合登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameがひらがな、カタカナ、漢字以外だった場合登録できない" do
        @user.family_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが空だった場合登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameがひらがな、カタカナ、漢字以外だった場合登録できない" do
        @user.first_name = "hirosi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_kanaが空だった場合登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaがカタカナ以外だった場合登録できない" do
        @user.family_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "first_name_kanaが空だった場合登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナ以外だった場合登録できない" do
        @user.first_name_kana = "ひろし"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空だった場合登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
