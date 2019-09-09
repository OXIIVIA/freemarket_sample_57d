class RemoveColumnAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :city, :string
    remove_column :addresses, :address_prefecture, :integer
  end
end
