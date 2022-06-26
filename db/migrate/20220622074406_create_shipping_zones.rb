class CreateShippingZones < ActiveRecord::Migration[6.1]
  def self.up
    create_table :shipping_zones do |t|
      t.string :name, :null => false

      t.timestamps
    end

    execute "ALTER TABLE shipping_zones ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE shipping_zones ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def self.down
    drop_table :shipping_zones
  end
end
