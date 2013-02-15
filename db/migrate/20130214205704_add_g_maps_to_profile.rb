class AddGMapsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gmaps, :boolean
  end
end
