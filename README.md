# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birth_date         | date    | null: false |
| area_id            | integer | null: false |
| address            | string  | null: false |
| phone_number       | string  | null: false |


### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
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

