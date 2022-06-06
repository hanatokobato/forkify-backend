class CreateImages < ActiveRecord::Migration[6.1]
  def up
    create_table :images do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.integer :position
      t.string  :caption
      t.string :photo_link
    end

    add_index :images, :imageable_id
    add_index :images, :imageable_type
    add_index :images, :position
  end

  def down
    drop_table :images
  end
end
