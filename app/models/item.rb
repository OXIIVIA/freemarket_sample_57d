class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :delivery
  has_many :favorites
  has_many :categories, through: :item_categories
  belongs_to :group, optional: true
  belongs_to :brand, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition, presence: true
  validates :deliver_date, presence: true
  validates :postage, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :price,numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
  validates :image, presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
