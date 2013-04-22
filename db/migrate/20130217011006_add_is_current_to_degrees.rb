class AddIsCurrentToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :is_current, :boolean
  end
end
