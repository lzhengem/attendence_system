class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :crn
      t.string :section
      t.string :title

      t.timestamps null: false
      
      
    end
    
    add_index :courses, :crn, unique: true
  end
end
