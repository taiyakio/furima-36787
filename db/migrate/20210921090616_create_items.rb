class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name 
      t.integer :price
      t.integer :category_id 
      t.integer :condition_id
      t.integer :shippingcharges_id
      t.integer :area_id
      t.integer :shippingdate_id
      t.references :user
      t.timestamps
    end
  end
end
