# README

# テーブル設計
## users テーブル
| Column           | Type       | Options     |
| ---------------- | ------     | ----------- |
| nickname         | string     | null: false |
| password         | string     | null: false |
| email            | string     | null: false unique: true, index:true |
| first_name       | string     | null: false |
| family_name      | string     | null: false |
| first_name_kana  | string     | null: false |
| family_name_kana | string     | null: false |
| birth_day        | date       | null: false |
### Association
- has_many :items
- has_many :item_purchases


## sending_destinations テーブル
| Column                       |  Type        |   Options   |
| ---------------------------- | -----------  | ----------- |
| post_code                    | string       | null: false |
| prefecture_code_id           | integer      | null: false |
| city                         | string       | null: false |
| house_number                 | string       | null: false |  
| building_name                | string       |             |
| phone_number                 | string       | null: false |
| item_purchase          　    | reference   | null: false, foreign_key: true | 
### Association
- belongs_to :item_purchase


## items テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ------------|
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| goods_condition_id | integer    | null: false |
| postage_type_id    | integer    | null: false | 
| delivery_area_id   | integer    | null: false |
| preparation_day_id | integer    | null: false |
| price              | integer    | null: false |
| user               | reference   | null: false, foreign_key: true | 
### Association
- belongs_to :user
- has_one :item_purchase


## item_purchases テーブル
| Column          | Type       | Options     |
| ----------------| ---------- | ------------| 
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :sending_destination


## 画像をアップロードする際はActive Storage Gemを用いる。