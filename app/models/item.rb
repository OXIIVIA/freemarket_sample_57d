class Item < ApplicationRecord
  has_one :delivery
  has_many :favorites
  has_many :categories, through: :item_categories
  belongs_to :group
  belongs_to :brand
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
