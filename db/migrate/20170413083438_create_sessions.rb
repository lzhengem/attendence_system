class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :section, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
