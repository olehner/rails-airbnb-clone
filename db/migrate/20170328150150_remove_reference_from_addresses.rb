class RemoveReferenceFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_reference  :addresses, :user
  end
end
