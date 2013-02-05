class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.references :profile
      t.references :university
      t.string :type_of_degree
      t.string :primary_focus
      t.string :secondary_focus
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :degrees, :profile_id
    add_index :degrees, :university_id
  end
end
