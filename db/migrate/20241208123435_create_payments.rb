class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :fee, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
