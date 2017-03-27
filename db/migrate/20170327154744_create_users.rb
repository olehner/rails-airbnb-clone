class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :bio
      t.string :phone_number
      t.boolean :is_parklord

      t.timestamps
    end
  end
end
