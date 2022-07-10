class CreateAddresses < ActiveRecord::Migration[6.1]
  def up
    create_table :addresses do |t|
      t.integer :address_type
      t.string :first_name
      t.string :last_name
      t.string :addressable_type, index: true
      t.integer :addressable_id, index: true
      t.string :address1
      t.string :city
      t.integer :country_id, index: true
      t.integer :state_id, index: true
      t.string :zip_code
      t.boolean :is_default, default: false
      t.boolean :is_billing_default, default: false

      t.timestamps
    end

    execute "ALTER TABLE addresses ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE addresses ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :addresses
  end
end
