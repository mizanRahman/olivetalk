class AddCommentToResource < ActiveRecord::Migration
  def change
    add_column :resources, :comment, :text
  end
end
