require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@がなければ登録できないこと' do
      @user.email = 'jojo.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが全角だと登録できないこと' do
      @user.password = '１２３４５６７'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角でも英数混合でなければ登録できないこと' do
      @user.password = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = 'ab345'
      @user.password_confirmation = 'ab345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名の名字が空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name 全角の漢字・ひらがな・カタカナで入力してください')
    end
    it 'ユーザー本名の名字が全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと' do
      @user.family_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name 全角の漢字・ひらがな・カタカナで入力してください')
    end
    it 'ユーザー本名の名前が空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角の漢字・ひらがな・カタカナで入力してください')
    end
    it 'ユーザー本名の名前が全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと' do
      @user.first_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角の漢字・ひらがな・カタカナで入力してください')
    end
    it 'ユーザー本名の名字フリガナが空では登録できないこと' do
      @user.fam_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam reading can't be blank", 'Fam reading 全角のカタカナで入力してください')
    end
    it 'ユーザー本名の名字フリガナが全角（カタカナ）以外であれば登録できないこと' do
      @user.fam_reading = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fam reading 全角のカタカナで入力してください')
    end
    it 'ユーザー本名の名前フリガナが空では登録できないこと' do
      @user.fir_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fir reading can't be blank", 'Fir reading 全角のカタカナで入力してください')
    end
    it 'ユーザー本名の名前フリガナが全角（カタカナ）以外であれば登録できないこと' do
      @user.fir_reading = '次郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fir reading 全角のカタカナで入力してください')
    end
    it '生年月日が空だと登録できないこと' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
