# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false, unique: true |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | date   | null: false               |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| product     | string     | null: false       |
| description | text       | null: false       |
| category    | integer    | null: false       |
| status      | integer    | null: false       |
| charge      | integer    | null: false       |
| area        | integer    | null: false       |
| days        | integer    | null: false       |
| price       | string     | null: false       |
| user        | references | null: false, foreign_key: true |


### Association
- belongs_to :users
- has_one :purchases
- has_one :shipping


## shipping テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| state       | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | string     | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association
belongs_to :items


## purchases テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

