require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context "アイテムが保存できる場合" do
      it "全て入力できていればアイテムは保存される" do
        expect(@item).to be_valid
      end
    end
    context "アイテムが保存できない場合" do
      it "タイトルがないとアイテムは保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "ユーザーが紐付いていないとアイテムは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
