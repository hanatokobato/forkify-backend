class CreateCarts < ActiveRecord::Migration[6.1]
  def up
    create_table :carts do |t|
      t.integer :user_id, index: true

      t.timestamps
    end

    execute "ALTER TABLE carts ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE carts ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    drop_table :carts
  end
end
