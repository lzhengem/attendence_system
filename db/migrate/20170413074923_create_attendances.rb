class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :date
      t.references :section, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.boolean :presence

      t.timestamps null: false
    end
  end
end
