class CreateScreening < ActiveRecord::Migration[5.2]
  def change
    create_table :screenings do |t|
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.json :seat_map
      
      t.timestamps

      t.belongs_to :movie , foreign_key: true
      t.belongs_to :screen , foreign_key: true
    end
  end
end
