class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :auth0_id
      t.string :name
      t.string :nickname
      t.string :email

      t.timestamps
    end
  end
end
