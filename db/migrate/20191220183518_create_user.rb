class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # Handles authentication
      t.string :email, null: false
      t.string :password_digest

      # User attributes
      t.string :username, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday

      # Handles authorization
      t.boolean :is_admin, default: false

      # Handles timestamps
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :username
  end
end
