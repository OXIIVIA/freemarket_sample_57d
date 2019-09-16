class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture


  validates :prefecture_id, presence: true
  validates :address_last_name, presence: true
  validates :address_first_name, presence: true
  validates :address_last_name_kana, presence: true
  validates :address_first_name_kana, presence: true
  # validates :birthdate_year, presence: true
  # validates :birthdate_month, presence: true
  # validates :birthdate_day, presence: true
end
