class Item < ApplicationRecord
  belongs_to :category, optional: true

   # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
   belongs_to :saler, class_name: "User"
   belongs_to :buyer, class_name: "User"
 
   validates :name, presence: true, length: { maximum: 40 }
   validates :detail, presence: true, length: { maximum: 1000 }
   validates :price, presence: true, inclusion: { in: (300..999999) }

  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end 

end
