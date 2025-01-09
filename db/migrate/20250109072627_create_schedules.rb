class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :menu, null: false, foreign_key: true
      t.integer :departure_type, null: false
      t.integer :num_reservation, null: false, default: 0
      t.text :memo
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
