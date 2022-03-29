class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.bigint :recipe_id, index: true
      t.decimal :quantity
      t.string :unit
      t.text :description

      t.timestamps
    end
  end
end
