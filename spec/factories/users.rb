FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'sample@gmail.com' }
    password              { 'aaa111' }
    encrypted_password    { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '1930-1-1' }
  end
end
