# このアプリについて
- フリマサイト（メルカリクローン）
- 制作期間:July 30th, 2020 ~ September 2th, 2020

# 制作者
## 苑田 拓真

## サイトURL (Basic認証キー)
- ユーザー名: taku
- パスワード: 0223
- サイトURL: https://furima-28275.herokuapp.com/

### ER図
https://i.gyazo.com/243cb87b6ed10319e5970557a5f8ba4c.png

# テーブル設計

## users テーブル

| Column           | Type   | Options    |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| flat_family_name | string | null: false |
| flat_first_name  | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
| password         | string | null: false | 

### Association
- has_many :items
- has_many :purchase_items

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| buyer_id      | integer    |                                |


### Association

- has_many :purchase_items
- belongs_to :user

## purchase_items テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_item

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_number    | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone            | string     | null: false                    |
| purchase_item_id | references | null: false, foreign_key: true |
 ### Association

 - belongs_to :purchase_item
