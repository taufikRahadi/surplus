class CreateImageProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :image_products do |t|
      t.references :products, foreign_key: true
      t.references :images, foreign_key: true
      t.timestamps
    end
  end
end
