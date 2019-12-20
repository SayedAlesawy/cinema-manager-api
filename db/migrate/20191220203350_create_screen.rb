class CreateScreen < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.integer :number, null: false
      t.integer :rows, null: false
      t.integer :columns, null: false
    end

    add_index :screens, :number, unique: true
  end
end
