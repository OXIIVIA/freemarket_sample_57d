class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name 
      t.integer      :price, null: false
      t.string       :size 
      t.string       :image, after: :name 
      t.string       :situation, null: false, after: :detail 
      t.string       :status, null: false
      t.string       :pay_way  
      t.string       :deliver_way
      t.string       :deliver_date  
      t.string      :deliver_fee
      t.integer      :saler_id
      t.integer      :buyer_id
      t.integer      :brand_id ,foreign_key: true
      t.integer      :category_id ,foreign_key: true
      t.text         :detail

      t.timestamps
    end
  end
end
