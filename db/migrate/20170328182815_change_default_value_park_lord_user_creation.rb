class ChangeDefaultValueParkLordUserCreation < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_parklord, :boolean, default: false 
  end
end
