class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :day

  validates :product, :description, :price, :image, presence: true
  validates :category_id, :status_id, :charge_id, :area_id, :day_id, numericality: { other_than: 1 }
end
