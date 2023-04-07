# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| surname            | string | null: false               |
| first_name         | string | null: false               |
| surname_kana       | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :comments
- has_many :items
- has_one :buyer

## items テーブル

| Column      | Type       | Options                       |
| ------      | ------     | -----------                   |
| title       | string     | null: false                   |
| textbox     | text       | null: false                   |
| price       | integer    | null: false                   |
| category_id | integer    | null: false                   |
|prefecture_id| integer    | null: false                   |
| postage_id  | integer    | null: false                   |
| region_id   | integer    | null: false                   |
| shipment_id | integer    | null: false                   |
| user        | references | null: false, foreign_key: true|


### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## buyers テーブル

| Column    | Type       | Options                       |
| ------    | ------     | -----------                   |
| user      | references | null: false, foreign_key: true|
| item      | references | null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- has_one :shopping


# shoppings テーブル

| Column        | Type       | Options                       |
| ------        | ------     | -----------                   |
| post_code     | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| telephone     | string     | null: false                   |
| buyer         | references | null: false, foreign_key: true|


### Association

- belongs_to :buyer


## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
