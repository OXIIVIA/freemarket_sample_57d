class RemoveColumnSize < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size, :string
  end
end
