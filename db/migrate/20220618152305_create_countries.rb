class CreateCountries < ActiveRecord::Migration[6.1]
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :abbreviation, :limit => 5
      t.boolean :active,       :default => false

      t.timestamps
    end
    add_index :countries, :name

    execute "ALTER TABLE countries ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE countries ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def self.down
    drop_table :countries
  end
end
