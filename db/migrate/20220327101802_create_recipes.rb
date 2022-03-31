class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :publisher
      t.string :source_url
      t.string :image_url
      t.integer :servings
      t.string :cooking_time

      t.timestamps
    end
  end
end
