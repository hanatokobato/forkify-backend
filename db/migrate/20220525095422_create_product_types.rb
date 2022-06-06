class CreateProductTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :product_types do |t|
      t.string    :name
      t.integer   :parent_id
      t.boolean   :active, :default => true
      t.integer :rgt, index: true
      t.integer :lft, index: true

      t.timestamps
    end

    execute "ALTER TABLE product_types ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE product_types ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :product_types
  end
end
