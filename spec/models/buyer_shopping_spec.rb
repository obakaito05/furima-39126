require 'rails_helper'

RSpec.describe BuyerShopping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shopping = FactoryBot.build(:buyer_shopping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '必須の項目が入力されていれば購入できる' do
        expect(@buyer_shopping).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buyer_shopping.building = ''
        expect(@buyer_shopping).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it '郵便番号が入力されていない' do
        @buyer_shopping.post_code = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号がハイフンなしの半角文字列ではない' do
        @buyer_shopping.post_code = '１２３３３３３'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県の住所が「---」選択されている場合は出品できない' do
        @buyer_shopping.region_id = '1'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Region を選択してください。")
      end
      it '市町村が入力されていない' do
        @buyer_shopping.municipality = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が入力されていない' do
        @buyer_shopping.address = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていない' do
        @buyer_shopping.telephone = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号が12桁以上ある' do
        @buyer_shopping.telephone = '111111111111'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が9桁しかない' do
        @buyer_shopping.telephone = '111111111'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が半角数字以外は登録できない' do
        @buyer_shopping.telephone = '２１３４５６７７６５２'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Telephone is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_shopping.user_id = nil
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buyer_shopping.item_id = nil
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buyer_shopping.token = nil
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
