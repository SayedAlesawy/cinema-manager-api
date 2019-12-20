class CreateMovie < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.integer :duration, null: false

      t.timestamps
    end

    add_index :movies, :name
  end
end
