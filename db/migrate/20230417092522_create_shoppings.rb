class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone, null: false
      t.references :buyer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
