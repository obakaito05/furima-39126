class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :textbox, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :postage_id, null: false
      t.integer :region_id, null: false
      t.integer :shipment_id, null: false
      t.references :user
      t.timestamps
    end
  end
end
