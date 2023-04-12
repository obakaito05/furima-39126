require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context "アイテムが保存できる場合" do
      it "全ての項目が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "アイテムが保存できない場合" do
      it "出品名が空では出品できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "商品画像が空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品説明が空では出品できない" do
        @item.textbox = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Textbox can't be blank")
      end
      it "カテゴリーに「---」が選択されている場合は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態に「---」が選択されている場合は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "配送料の負担に「---」が選択されている場合は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "発送元の地域に「---」が選択されている場合は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "発送までの日数に「---」が選択されている場合は出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "価格が空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = 'ade12634'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が300円未満では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "価格が9,999,999円を超えると出品できない" do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
