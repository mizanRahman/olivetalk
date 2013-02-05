class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :abbreviated_name
      t.integer :zipcode

      t.timestamps
    end
  end
end
