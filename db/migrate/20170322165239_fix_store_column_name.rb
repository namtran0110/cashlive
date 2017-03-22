class FixStoreColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :stores, :slug, :name
  end
end
