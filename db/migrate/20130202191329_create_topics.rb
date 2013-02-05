class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :is_approved
      t.boolean :is_featured
      t.integer :last_poster_id
      t.timestamp :last_post_at
      t.references :user
      t.references :network

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :network_id
  end
end
