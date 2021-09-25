require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'nameとexplanationとimageとcategory_idとcondition_idとshippingcharges_idとarea_idとshippingdate_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( "Image can't be blank" )
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
    context '出品できないとき（選択）' do
      it 'category_idが未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Category must be other than 1" )
      end
      it 'condition_idが未選択では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Condition must be other than 1" )
      end
      it 'shippingcharges_idが未選択では登録できない' do
        @item.shippingcharges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Shippingcharges must be other than 1" )
      end
      it 'area_idが未選択では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Area must be other than 1" )
      end
      it 'shippingdate_idが未選択では登録できない' do
        @item.shippingdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Shippingdate must be other than 1" )
      end
    end
    context '出品できないとき（価格）' do
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price can't be blank" )
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not a number" )
      end
      it 'priceが300円未満では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price must be greater than or equal to 300" )
      end
      it 'priceが9999999円超過では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999" )
      end
    end
  end
end