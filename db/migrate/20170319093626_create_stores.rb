class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end

    remove_foreign_key :stores, :users
    add_foreign_key :stores, :users, on_delete: :cascade
  end
end
