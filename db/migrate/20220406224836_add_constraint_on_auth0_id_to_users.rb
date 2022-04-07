class AddConstraintOnAuth0IdToUsers < ActiveRecord::Migration[6.1]
  def up
    execute "ALTER TABLE users ADD CONSTRAINT uniq_auth0_user UNIQUE (auth0_id)"
  end

  def down
    execute "ALTER TABLE users DROP CONSTRAINT uniq_auth0_user"
  end
end
