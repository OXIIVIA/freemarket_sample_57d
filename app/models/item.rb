class Item < ApplicationRecord
  has_one :delivery
  has_many :favorites
  has_many :categories, through: :item_categories
  belongs_to :group, optional: true
  belongs_to :brand, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
end
