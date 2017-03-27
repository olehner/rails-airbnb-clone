class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :booking, foreign_key: true
      
      t.references :reviewable, :polymorphic => true


      t.timestamps
    end
  end
end
