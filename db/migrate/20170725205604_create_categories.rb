class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: false do |t|
      uuid_primary_key(t)

      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      uuid_reference(t, :parent_id)
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end

    add_foreign_key :categories, :categories, column: :parent_id, on_delete: :nullify
    add_index :categories, :lft
    add_index :categories, :rgt
  end
end
