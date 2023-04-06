# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| surname            | string | null: false               |
| firstname          | string | null: false               |
| surname_kana       | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :comments
- has_many :items

## items テーブル

| Column      | Type       | Options                       |
| ------      | ------     | -----------                   |
| title       | string     | null: false                   |
| textbox     | text       | null: false                   |
| price       | integer    | null: false                   |
| category_id | integer    | null: false                   |
| state_id    | integer    | null: false                   |
| postage_id  | integer    | null: false                   |
| region_id   | integer    | null: false                   |
| date_id     | integer    | null: false                   |
| user        | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## buyer テーブル

| Column          | Type       | Options                       |
| ------          | ------     | -----------                   |
| user            | references | null: false, foreign_key: true|
| user_address    | string     | null: false                   |
| purchase_history| string     | null: false                   |

### Association

- belongs_to :item


## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
