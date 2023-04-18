require 'rails_helper'

RSpec.describe BuyerShopping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shopping = FactoryBot.build(:buyer_shopping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '必須の項目が入力されていれば購入できる' do
        expect(@buyer_shopping).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it '郵便番号が入力されていない' do
        @buyer_shopping.post_code = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '郵便番号がハイフンなしの半角文字列ではない' do
        @buyer_shopping.post_code = '１２３３３３３'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '都道府県の住所が「---」選択されている場合は出品できない' do
        @buyer_shopping.region_id = '1'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Region can't be blank")
      end
      it '市町村が入力されていない' do
        @buyer_shopping.municipality = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '番地が入力されていない' do
        @buyer_shopping.address = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '電話番号が入力されていない' do
        @buyer_shopping.telephone = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '電話番号が12桁以上ある' do
        @buyer_shopping.telephone = '111111111111'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it '電話番号が9桁しかない' do
        @buyer_shopping.telephone = '111111111'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Password can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
