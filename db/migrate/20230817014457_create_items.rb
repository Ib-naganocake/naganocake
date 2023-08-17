class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.integer :price_without_tax, null: false
      t.boolean :is_sales, null: false, default: true

      t.timestamps
    end
  end
end
