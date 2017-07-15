class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, id: false do |t|
      uuid_primary_key(t)
      uuid_reference(t, :user_id, null: false)

      t.text :title, null: false
      t.text :slug, null: false
      t.text :original_content
      t.text :rendered_content, null: false

      t.timestamps
    end

    add_foreign_key :posts, :users, on_delete: :restrict
  end
end
