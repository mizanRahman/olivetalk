class AddGraduationYearToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :graduation_year, :integer
  end
end
