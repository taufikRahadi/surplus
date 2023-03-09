class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.string :file, null: false
      t.boolean :enable, null: false
      t.timestamps
    end
  end
end
