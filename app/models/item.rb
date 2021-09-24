class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingcharges
  belongs_to :area
  belongs_to :shippingdate
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :name, :price, :explanation, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id, :condition_id, :shippingcharges_id,
            :area_id, :shippingdate_id
  end
end
