require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user1.id)
    @record_address = FactoryBot.build(:record_address, item_id: @item.id, user_id: @user2.id)
  end

  describe 'ユーザー新規登録' do
    context '商品購入がうまくいくとき' do
      it '全ての値が存在すれば登録できる' do
        expect(@record_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-がないと購入できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code半角数字以外だと購入できない' do
        @record_address.postal_code = '１２３-４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'shipment_source_idが空では登録できない' do
        @record_address.shipment_source_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'shipment_source_idが1では登録できない' do
        @record_address.shipment_source_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it 'cityが空では登録できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと登録できない' do
        @record_address.phone_number = '１２３４５６７８９０'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
