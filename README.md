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
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| fn_furigana        | string   | null: false |
| ln_furigana        | string   | null: false |
| birthdate          | date     | null: false |

### Association
- has_many :products
- has_many :user_products

## productsテーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shippingcharges_id | integer    | null: false |
| area_id            | integer    | null: false |
| shippingdate_id    | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :user_product

## user_productsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product

## shipping_addressテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| area_id          | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| telephone_number | string     | null: false |
| user_products    | references | null: false, foreign_key: true |

### Association
- belongs_to :user_products
