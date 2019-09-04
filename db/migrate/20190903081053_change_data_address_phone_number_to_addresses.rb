class ChangeDataAddressPhoneNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :address_phone_number, :string
  end
end
