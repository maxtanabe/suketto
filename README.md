# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birth_date         | date    | null: false |


### Association

- has_many :posts
- has_many :purchase_histories
- has_many :comments


## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_history
- has_many :comments


## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | text       | null: false                    |
| user             | integer    | null: false                    |
| post             | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :post




## purchase_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :post
- has_one :address


## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | string     | null: false                    |
| city_name        | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_address | string     |                                |
| phone_number     | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| purchase_history | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_history
