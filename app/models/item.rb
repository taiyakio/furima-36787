class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingcharges
  belongs_to :user
  has_one_attached :image

  validates :name, :price, :explanation, :category_id, :condition_id,
            :shippingcharges_id, :area_id, :shippingdate_id, :image, presence: true
end
