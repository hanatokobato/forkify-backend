class AddShippingZoneIdToCountriesAndStates < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :shipping_zone_id, :bigint
    add_column :states, :shipping_zone_id, :bigint
  end
end
