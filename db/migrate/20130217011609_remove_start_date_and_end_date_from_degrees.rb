class RemoveStartDateAndEndDateFromDegrees < ActiveRecord::Migration
  def up
	remove_column :degrees, :start_date
	remove_column :degrees, :end_date
  end

  def down
	add_column :degrees, :start_date, :date
	add_column :degrees, :end_date, :date
  end
end
