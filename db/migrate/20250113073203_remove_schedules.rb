class RemoveSchedules < ActiveRecord::Migration[8.0]
  def up
    remove_column :schedules, :departure_type
  end

  def down
    add_column :schedules, :departure_type, :integer
  end
end
