class RemoveColumnItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :postage, :integer
    remove_column :items, :category_id, :integer
    remove_column :items, :condition, :integer
    remove_column :items, :deliver_date, :integer
    remove_column :items, :prefecture_id, :integer
  end
end
