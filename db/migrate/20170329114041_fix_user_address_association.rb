class FixUserAddressAssociation < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :user_id, :integer
    add_reference :users, :address, index: true
  end
end
