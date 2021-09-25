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
  validates :name, :explanation, :image, presence: true

  # 販売価格を空では保存できない・¥300〜9,999,999の間のみ保存可能
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id, :condition_id, :shippingcharges_id,
            :area_id, :shippingdate_id
  end
end
