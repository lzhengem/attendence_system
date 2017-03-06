class AddColumnsToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :course_id, :integer
    add_column :rosters, :student_id, :integer
    
    add_index :rosters, :course_id
  end
end
