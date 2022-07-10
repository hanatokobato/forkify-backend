class CreateOrders < ActiveRecord::Migration[6.1]
  def up
    create_table :orders do |t|
      t.string :number, index: true
      t.string :ip_address
      t.string :email, index: true
      t.string :state
      t.integer :user_id
      t.integer :bill_address_id, index: true
      t.integer :ship_address_id, index: true
      t.boolean :shipped, :default => false
      t.datetime :calculated_at
      t.datetime :completed_at

      t.timestamps
    end

    execute "ALTER TABLE orders ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE orders ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :orders
  end
end
