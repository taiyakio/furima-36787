require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、last_name、fn_furigana、ln_furigana、birthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do  
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前カナが空では登録できない' do
        @user.fn_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fn furigana can't be blank")
      end
      it '名字カナが空では登録できない' do
        @user.ln_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ln furigana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは＠を含まないと登録できない' do  
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'Rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
      end
      it '名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字を使用してください')
      end
      it '名前カナが全角（カタカナ）でなければ登録できない' do
        @user.fn_furigana = 'Rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Fn furigana はカタカナで入力して下さい')
      end
      it '名字カナが全角（カタカナ）でなければ登録できない' do
        @user.ln_furigana = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ln furigana はカタカナで入力して下さい')
      end
    end
  end
end
