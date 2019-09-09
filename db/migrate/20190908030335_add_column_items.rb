class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :deliver_date, :integer, null: false
    add_column :items, :category_id, :integer, null: false,foreign_key: true
  end
end
