class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' if postgresql?

    create_table :users, id: false do |t|
      uuid_primary_key(t)

      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.boolean :admin, null: false, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
