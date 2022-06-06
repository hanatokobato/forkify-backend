class CreateProducts < ActiveRecord::Migration[6.1]
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :old_price
      t.boolean :on_sale
      t.boolean :sold_out
      t.boolean :featured
      t.integer :quantity
      t.integer :product_type_id

      t.timestamps
    end

    execute "ALTER TABLE products ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE products ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :products
  end
end
