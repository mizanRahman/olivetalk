class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.text :description
      t.boolean :is_public

      t.timestamps
    end
  end
end
