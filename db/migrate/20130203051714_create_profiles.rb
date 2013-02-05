class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.string :conflict
      t.text :about_me
      t.string :blog_url
      t.string :facebook_url
      t.string :twitter_url
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
