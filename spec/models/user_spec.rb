require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
      end
      it "nicknameが40字を超えると登録できないこと" do
      end
      it "emailが空では登録できないこと" do
      end
      it "重複したemailが存在する場合登録できないこと" do
      end
      it "emailに@がなければ登録できないこと" do
      end
      it "passwordが空では登録できないこと" do
      end
      it "passwordが全角だと登録できないこと" do
      end
      it "passwordが5文字以下だと登録できないこと" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      end
      it "ユーザー本名の名字が空では登録できないこと" do
      end
      it "ユーザー本名の名字が全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと" do
      end
      it "ユーザー本名の名前が空では登録できないこと" do
      end
      it "ユーザー本名の名前が全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと" do
      end
      it "ユーザー本名の名字フリガナが空では登録できないこと" do
      end
      it "ユーザー本名の名字フリガナが全角（カタカナ）以外であれば登録できないこと" do
      end
      it "ユーザー本名の名前フリガナが空では登録できないこと" do
      end
      it "ユーザー本名の名前フリガナが全角（カタカナ）以外であれば登録できないこと" do
      end
      it "生年月日が空だと登録できないこと" do
      end
    end
  end
end
