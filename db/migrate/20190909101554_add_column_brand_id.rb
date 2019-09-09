class AddColumnBrandId < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand_id, :integer, foreign_key: true
  end
end
