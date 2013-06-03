class AddUnreadToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :unread, :boolean
    add_column :notifications, :sender_id, :integer

  end
end
