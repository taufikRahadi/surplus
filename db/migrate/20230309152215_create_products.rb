class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
