class RemoveReferenceFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :address, foreign_key: true
  end
end
