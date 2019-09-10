class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :delivery
  has_many :favorites
  has_many :categories, through: :item_categories
  belongs_to :group, optional: true
  belongs_to :brand, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  # has_one_attached :image
  
end
