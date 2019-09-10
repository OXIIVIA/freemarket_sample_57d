class RemoveColumnImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image, :text
  end
end
