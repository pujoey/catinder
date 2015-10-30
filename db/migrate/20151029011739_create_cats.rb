class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :image_uri
      t.integer :votes
      t.timestamps null: false
    end
  end
end
