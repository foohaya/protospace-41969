README
# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

### Association
- has_many :pototypes
- has_many :contents


## phototypesテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| title              | string    | null: false                    |
| catch_copy         | text      | null: false                    |
| concept            | text      | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
belongs_to :users
has_many :contents

## commentsテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| content            | text      | null: false                    |
| prototype          | reference | null: false, foreign_key: true |
| user               | reference | null: false, foreign_key: true |


### Association
belongs_to :users
belongs_to :phototypes