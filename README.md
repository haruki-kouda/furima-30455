# README

# テーブル設計
## users テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| password       | string | null: false |
| email          | string | null: false unique: true, index:true|
### Association
- has_many : items
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :sending_destination, dependent: :destroy　

## profile テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| first_name       | string     | null: false |
| family_name      | string     | null: false |
| first_name_kana  | string     | null: false |
| family_name_kana | string     | null: false |
| birth_year       | date       | null: false |
| birth_month      | date       | null: false |
| birth_day        | date       | null: false |
| user             | references | null: false, foreign_key: true |
### Association
- belongs_to :user

## credit_cards テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer    | null: false |
| expiration_year  | integer    | null: false |
| expiration_month | integer    | null: false |
| security_code    | integer    | null: false |
| user             | references | null: false, foreign_key: true |
### Association
- belongs_to :user

## sending_destinations テーブル
| Column                       |  Type      | Options     |
| ---------------------------- | ------     | ----------- |
| destination_first_name       | string     | null: false |
| destination_family_name      | string     | null: false |
| destination_first_name_kana  | string     | null: false |
| destination_family_name_kana | string     | null: false |
| post_code                    | string     | null: false |
| prefecture_code              | text       | null: false |
| city                         | text       | null: false |
| house_number                 | reference  | null: false |  
| building_name                | text       | null: false |
| phone_number                 | text       | null: false |
| user                         | references | null: false, foreign_key: true | 
### Association
- belongs_to :users

## items テーブル
| Column          | Type       | Options     |
| ----------------| ---------- | ------------| 
| name            | string     | null: false |
| description     | text       | null: false   |
| category        | references | null: false   |
| item_condition  | string     | null: false |
| postage         | string     | null: false |
| delivery_area   | string     | null: false |
| preparation_day | string     | null: false |
| price           | integer    | null: false |
### Association
- belongs_to :user

## 画像をアップロードする際はActive Storage　Gemを用いる。