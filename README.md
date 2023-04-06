# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name-kana          | string | null: false               |
| birthday           | string | null: false               |


### Association

- has_many :comments
- has_many :items

## items テーブル

| Column      | Type       | Options                       |
| ------      | ------     | -----------                   |
| title       | string     | null: false                   |
| price       | string     | null: false                   |
| category    | string     | null: false                   |
| state       | string     | null: false                   |
| postage     | string     | null: false                   |
| region      | string     | null: false                   |
| date        | string     | null: false                   |
| user_id     | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- has_many :comments
- has_one :buyer

## buyer テーブル

| Column      | Type       | Options                       |
| ------      | ------     | -----------                   |
| user_id     | string     | null: false                   |
| user-address| string     | null: false                   |

### Association

- belongs_to :items


## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| item_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
