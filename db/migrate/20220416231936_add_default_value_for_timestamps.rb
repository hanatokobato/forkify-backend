class AddDefaultValueForTimestamps < ActiveRecord::Migration[6.1]
  def up
    execute "ALTER TABLE recipes ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE recipes ALTER COLUMN updated_at SET DEFAULT now()"
    execute "ALTER TABLE ingredients ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE ingredients ALTER COLUMN updated_at SET DEFAULT now()"
    execute "ALTER TABLE users ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE users ALTER COLUMN updated_at SET DEFAULT now()"
  end

  def down
    execute "ALTER TABLE recipes ALTER COLUMN created_at SET DEFAULT NULL"
    execute "ALTER TABLE recipes ALTER COLUMN updated_at SET DEFAULT NULL"
    execute "ALTER TABLE ingredients ALTER COLUMN created_at SET DEFAULT NULL"
    execute "ALTER TABLE ingredients ALTER COLUMN updated_at SET DEFAULT NULL"
    execute "ALTER TABLE users ALTER COLUMN created_at SET DEFAULT NULL"
    execute "ALTER TABLE users ALTER COLUMN updated_at SET DEFAULT NULL"
  end
end
