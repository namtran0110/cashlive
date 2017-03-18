class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :username
      t.string :password_digest
      t.text :address
      t.text :description
      t.string :phone_number
      t.string :avatar_path

      t.timestamps
    end
  end
end
