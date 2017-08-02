class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles, id: false do |t|
      uuid_primary_key(t)
      uuid_reference(t, :author_id, null: false)
      uuid_reference(t, :category_id)

      t.text :title, null: false
      t.text :slug, null: false
      t.text :original_content
      t.text :rendered_content, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at

      t.timestamps
    end

    add_foreign_key :articles, :users, on_delete: :restrict, column: :author_id
    add_foreign_key :articles, :categories, on_delete: :nullify
  end
end
