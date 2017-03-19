class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :store, foreign_key: {on_delete: :cascade}
      t.integer :sender_id
      t.string :body

      t.timestamps
    end
  end
end
