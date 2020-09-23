# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type    | Options                       |
| --------------------- | ------- | ----------------------------- |
| name                  | string  | null: false                   |
| item_text             | text    | null: false                   | 
| category              | integer | null: false                   |
| item_condition        | integer | null: false                   |
| shipping_fee          | integer | null: false                   | 
| shipping_area         | integer | null: false                   |
| delivery_days         | integer | null: false                   |
| price                 | integer | null: false                   | 
| user_id               | integer | null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item



## shipping_address テーブル

| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures      | integer    | null: false                    |
| municipalities   | string     | null: false                    |