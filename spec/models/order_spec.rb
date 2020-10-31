require 'rails_helper'
describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    it '全ての項目の入力が存在すれば商品購入できること' do
      expect(@order).to be_valid
    end
  end

  it 'post_codeが空だと購入できないこと' do
    @order.post_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code can't be blank")
  end

  it 'prefecture_code_idが空だと購入できないこと' do
    @order.prefecture_code_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture code can't be blank")
  end

  it 'cityが空だと購入できないこと' do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it 'house_numberが空だと購入できないこと' do
    @order.house_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("House number can't be blank")
  end

  it 'phone_numberが空だと購入できないこと' do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'tokenが空だと購入できないこと' do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it 'post_codenはハイフンがないと購入できないこと' do
    @order.post_code = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include('Post code is invalid')
  end

  it 'phone_numberは11桁以内でないと購入できないこと' do
    @order.phone_number = '090123456789'
    @order.valid?
    expect(@order.errors.full_messages).to include('Phone number is invalid')
  end

  it 'prefecture_code_idが１だと購入できないこと' do
    @order.prefecture_code_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include('Prefecture code must be other than 1')
  end

  it 'building_nameが空でも購入できること' do
    @order.building_name = nil
    expect(@order).to be_valid
  end

  it 'phone_numberにハイフンがある場合は購入できないこと' do
    @order.phone_number = '090-1234-5678'
    @order.valid?
    expect(@order.errors.full_messages).to include('Phone number is invalid')
  end
end
