class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :activity_type
      t.string :object_type
      t.string :object_url
      t.datetime :time_sent
      t.references :subscription
      t.references :user

      t.timestamps
    end
    add_index :notifications, :subscription_id
    add_index :notifications, :user_id
  end
end
