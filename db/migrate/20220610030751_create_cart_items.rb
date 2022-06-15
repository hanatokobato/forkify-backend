class CreateCartItems < ActiveRecord::Migration[6.1]
  def up
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :quantity,    :default => 1
      t.boolean :active,      :default => true
      t.integer :item_type_id,                  :null   => false
      t.integer :product_id

      t.timestamps
    end

    execute "ALTER TABLE cart_items ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE cart_items ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :cart_items
  end
end
