class RemoveReferenceFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_reference  :accounts, :user
  end
end
