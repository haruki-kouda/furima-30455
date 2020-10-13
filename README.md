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
| birth_year       | date       | null: false |
| birth_month      | date       | null: false |
| birth_day        | date       | null: false |
| user             | references | null: false, foreign_key: true |
### Association
- has_one :sending_destination, dependent: :destroy
- has_many :items
- has_one :transaction


## sending_destinations テーブル
| Column                       |  Type        |   Options   |
| ---------------------------- | -----------  | ----------- |
| prefecture_code              | integer      | null: false |
| city                         | string       | null: false |
| house_number                 | string       | null: false |  
| building_name                | string       |             |
| phone_number                 | integer      | null: false |
| user                         | references   | null: false, foreign_key: true | 
### Association
- belongs_to :user


## items テーブル
| Column          | Type       | Options     |
| ----------------| ---------- | ------------| 
| name            | string     | null: false |
| description     | text       | null: false |
| category        | integer    | null: false |
| item_condition  | integer    | null: false |
| postage         | integer    | null: false |
| delivery_area   | integer    | null: false |
| preparation_day | integer    | null: false |
| price           | integer    | null: false |
### Association
- belongs_to :user
- has_one :transaction


## transaction テーブル
| Column          | Type       | Options     |
| ----------------| ---------- | ------------| 
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item

## 画像をアップロードする際はActive Storage　Gemを用いる。