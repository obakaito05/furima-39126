require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、password、surname、first_name、surname_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含めなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'surnameが漢字、平仮名、カタカナ以外だと登録できない' do
        @user.surname = 'obana'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end
      it 'surnameが空だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname is invalid")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it 'first_nameが漢字、平仮名、カタカナ以外だと登録できない' do
        @user.first_name = 'kaito'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'surname_kanaがカタカナ以外だと登録できない' do
        @user.surname_kana = 'oba2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana is invalid")
      end
      it 'surname_kanaが空だと登録できない' do
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana can't be blank")
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = 'kai12'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it 'passwordが半角英数字を含まないときは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角の時は登録できない' do
        @user.password = 'ｓｓｓｓｓｓ３'
        @user.password_confirmation = 'ｓｓｓｓｓｓ３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'nicknameが空の時は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空の時は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

