class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :read_count
      t.integer :votes
      t.boolean :is_approved
      t.references :user
      t.references :topic

      t.timestamps
    end
    add_index :resources, :user_id
    add_index :resources, :topic_id
  end
end
