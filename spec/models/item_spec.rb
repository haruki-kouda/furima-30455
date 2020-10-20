require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it '全ての項目の入力が存在すれば出品できること' do
      expect(@item).to be_valid
    end
  end

  it 'nameが空だと登録できないこと' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it 'descriptionが空だと登録できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it 'category_idが空だと登録できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'goods_condition_idが空だと登録できないこと' do
    @item.goods_condition_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Goods condition can't be blank")
  end

  it 'postage_type_idが空だと登録できないこと' do
    @item.postage_type_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage type can't be blank")
  end

  it 'delivery_area_idが空だと登録できないこと' do
    @item.delivery_area_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery area can't be blank")
  end

  it 'preparation_day_idが空だと登録できないこと' do
    @item.preparation_day_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Preparation day can't be blank")
  end

  it 'imageが空だと登録できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it 'userが紐付いていないと保存できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end

  it 'priceは半角英数字でなければ登録できないこと' do
    @item.price = '１１１'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not a number')
  end

  it 'priceは300以下では登録できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('Price must be greater than 300')
  end

  it 'priceは9999999以上では登録できないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('Price must be less than 9999999')
  end

  it 'category_idが１だと登録できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Category must be other than 1')
  end

  it 'goods_condition_idが１だと登録できないこと' do
    @item.goods_condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Goods condition must be other than 1')
  end

  it 'postage_type_idが１だと登録できないこと' do
    @item.postage_type_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Postage type must be other than 1')
  end

  it 'delivery_area_idが１だと登録できないこと' do
    @item.delivery_area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
  end

  it 'preparation_day_idが１だと登録できないこと' do
    @item.preparation_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
  end
end
