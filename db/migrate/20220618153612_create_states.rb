class CreateStates < ActiveRecord::Migration[6.1]
  def self.up
    create_table :states do |t|

      t.string :name,                       :null => false
      t.string :abbreviation, :limit => 5,  :null => false,   :unique => true
      t.string :described_as
      t.integer :country_id,                :null => false

      t.timestamps
    end
    add_index :states, :name
    add_index :states, :country_id
    add_index :states, :abbreviation

    execute "ALTER TABLE states ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE states ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def self.down
    drop_table :states
  end
end
