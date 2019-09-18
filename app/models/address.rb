class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture


  validates :prefecture_id, presence: true
  validates :address_last_name, presence: true
  validates :address_first_name, presence: true
  validates :address_last_name_kana, presence: true, 
  format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "はカナ文字を入力してください" 
  }
  validates :address_first_name_kana, presence: true, format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "はカナ文字を入力してください" 
  }
  validates :address_number, presence: true, numericality: true, length: { is: 7 }
  validates :address_city, presence: true
  validates :address_block, presence: true
end
