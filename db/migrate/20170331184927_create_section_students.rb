class CreateSectionStudents < ActiveRecord::Migration
  def change
    create_table :section_students do |t|
      t.references :section, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
