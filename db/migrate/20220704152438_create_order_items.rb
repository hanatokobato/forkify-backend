class CreateOrderItems < ActiveRecord::Migration[6.1]
  def up
    create_table :order_items do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :total, :precision => 8, :scale => 2
      t.integer :order_id, index: true
      t.integer :product_id, index: true
      t.string :state
      t.integer :shipping_rate_id, index: true

      t.timestamps
    end

    execute "ALTER TABLE order_items ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE order_items ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :order_items
  end
end
