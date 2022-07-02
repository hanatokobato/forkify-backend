class CreateShippingRates < ActiveRecord::Migration[6.1]
  def self.up
    create_table :shipping_rates do |t|
      t.string  :name
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.bigint :shipping_zone_id

      t.timestamps
    end

    execute "ALTER TABLE shipping_rates ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE shipping_rates ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def self.down
    drop_table :shipping_rates
  end
end
