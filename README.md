# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| flat_family_name | string   | null: false |
| flat_first_name  | string   | null: false |
| birthday         | date     | null: false |

### Association
- has_many :items
- has_many :order_items
- has_one :auth_informations

## auth_informations テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| email   | integer    | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| image       | string     |null: false                     |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| postage     | string     | null: false                    |
| from        | string     | null: false                    |
| day         | datetime   | null: false                    |
| price       | integer    | null: false                    |

### Association

- has_many :order_items
- belongs_to :user

## order_items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :orders

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
|postal         | integer    | null: false                    |
| place         | string     | null: false                    |
| address       | string     | null: false                    |
|building       | string     |                                |
| phone         | integer    | null: false                    |
| order_item_id | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :order_item
