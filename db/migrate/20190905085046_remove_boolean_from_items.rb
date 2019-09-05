class RemoveBooleanFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :boolean, :string
  end
end
