class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
  validates :product
  validates :description
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :image
  end

  validates_inclusion_of :price, in:300..9999999
  validates :category_id, :status_id, :charge_id, :area_id, :day_id, numericality: { other_than: 1 }
  validates :price, numericality: true
end
