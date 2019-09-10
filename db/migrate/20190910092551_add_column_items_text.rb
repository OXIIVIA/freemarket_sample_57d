class AddColumnItemsText < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :postage, :text
    add_column :items, :category_id, :text
    add_column :items, :condition, :text
    add_column :items, :deliver_date, :text
    add_column :items, :prefecture_id, :string
  end
end
