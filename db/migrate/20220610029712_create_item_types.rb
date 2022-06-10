class CreateItemTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :item_types do |t|
      t.string :name

      t.timestamps
    end

    execute "ALTER TABLE item_types ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE item_types ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :item_types
  end
end
