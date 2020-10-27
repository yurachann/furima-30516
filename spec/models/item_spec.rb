require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it 'title,explain,category_id,condition_id,shipping_charge_id,shipment_source_id,shipment_date_id,price,userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'caregory_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipping_charge_idが空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'shipping_charge_idが1では登録できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it 'shipment_source_idが空では登録できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'shipment_source_idが1では登録できない' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'shipment_date_idが空では登録できない' do
        @item.shipment_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it 'shipment_date_idが1では登録できない' do
        @item.shipment_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment date must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数値でないなら登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300より下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
