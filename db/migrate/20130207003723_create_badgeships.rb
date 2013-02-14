class CreateBadgeships < ActiveRecord::Migration
  def change
    create_table :badgeships do |t|
      t.references :user
      t.references :badge

      t.timestamps
    end
    add_index :badgeships, :user_id
    add_index :badgeships, :badge_id
  end
end
