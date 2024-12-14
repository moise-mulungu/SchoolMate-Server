class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :teacher, null: false, foreign_key: true
      t.integer :number_of_students

      t.timestamps
    end
  end
end
