class CreateImages < ActiveRecord::Migration[6.1]
  def up
    create_table :images do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.integer :position
      t.string  :caption
      t.string :photo_link

      t.timestamps
    end

    add_index :images, :imageable_id
    add_index :images, :imageable_type
    add_index :images, :position

    execute "ALTER TABLE images ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE images ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :images
  end
end
