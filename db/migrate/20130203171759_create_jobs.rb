class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :organization
      t.string :position
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :is_current
      t.references :profile

      t.timestamps
    end
    add_index :jobs, :profile_id
  end
end
