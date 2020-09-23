# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password-confimation  | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | string | null: false | 


## items テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| image                 | text    | null: false |
| name                  | string  | null: false |
| item_text             | text    | null: false |
| category              | string  | null: false |
| item_condition        | string  | null: false |
| shipping_fee          | boolean | null: false |
| shipping_area         | string  | null: false |
| delivery_days         | string  | null: false |
| price                 | integer | null: false | 


## order テーブル

| Column                | Type       | Options     |
| --------------------- | ------     | ----------- |
| card_number           | integer    | null: false |
| expiration_date       | integer    | null: false |
| security_code         | integer    | null: false |
| postal_code           | integer    | null: false |
| prefectures           | string     | null: false |
| municipalities        | string     | null: false |
| address               | string     | null: false |
| building_name         | string     |             |
| phone                 | string     | null: false | 
| items_id              | references | null: false | 