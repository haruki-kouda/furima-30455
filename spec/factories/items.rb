FactoryBot.define do
  factory :item do
    name                { 'aaa' }
    description         { 'aaa' }
    category_id         {2}
    goods_condition_id  {2}
    postage_type_id     {2}
    delivery_area_id    {2}
    preparation_day_id  {2}
    price              {1111}

    association :user

    after(:build) do |itm|
      itm.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_image.png')
    end
  end
end
