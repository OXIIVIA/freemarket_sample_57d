class RemoveColumnItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :group_id, :integer
  end
end
