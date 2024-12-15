class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :institution_name
      t.string :category

      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
