class CreateRecipeBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_bookmarks do |t|
      t.bigint :user_id, index: true
      t.bigint :recipe_id, index: true

      t.timestamps
    end

    execute "ALTER TABLE recipe_bookmarks ALTER COLUMN created_at SET DEFAULT now()"
    execute "ALTER TABLE recipe_bookmarks ALTER COLUMN updated_at SET DEFAULT now()"
  end
end
