class AddApprovedToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :approved, :boolean
  end
end
