class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course, foreign_key: true

      t.timestamps null: false
    end
  end
end