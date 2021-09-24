class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :name, :price, :explanation, :category_id, :condision_id,
            :shippingcharges_id, :area_id, :shippingdate_id, :image, presence: true
end
