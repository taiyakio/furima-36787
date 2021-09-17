# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| fn_furigana        | string   | null: false |
| ln_furigana        | string   | null: false |
| dob                | datetime | null: false |

### Association
- belongs_to :buyer
- has_many :goods

## goodsテーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| goods_name        | string     | null: false |
| price             | integer    | null: false |
| category          | string     | null: false |
| condition         | string     | null: false |
| shipping_charges  | string     | null: false |
| ss_area           | string     | null: false |
| es_date           | string     | null: false |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buyers

## buyersテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer    | null: false |
| expiration       | datetime   | null: false |
| cvc              | integer    | null: false |
| postal_code      | integer    | null: false |
| prefectures      | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| telephone_number | string     | null: false |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :goods