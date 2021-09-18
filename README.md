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
| dob                | date     | null: false |

### Association
- has_many :goods
- has_many :user_goods

## goodsテーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| price               | integer    | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_charges_id | integer    | null: false |
| area_id             | integer    | null: false |
| date_id             | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- has_many :user
- has_many :user_goods

## user_goodsテーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user_id             | integer    | null: false |
| goods_id            | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :goods

## addressテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| area_id          | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| telephone_number | string     | null: false |
| user             | references | null: false, foreign_key: true |

### Association
- 
- 
