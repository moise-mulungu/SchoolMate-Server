class CreateFees < ActiveRecord::Migration[8.0]
  def change
    create_table :fees do |t|
      t.references :student, null: false, foreign_key: true
      t.decimal :amount
      t.decimal :total_paid
      t.date :due_date
      t.boolean :paid

      t.timestamps
    end
  end
end
