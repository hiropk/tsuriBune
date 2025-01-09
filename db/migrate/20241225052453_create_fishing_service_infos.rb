class CreateFishingServiceInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :fishing_service_infos do |t|
      t.string :name, null: false
      t.integer :pref, null: false
      t.integer :number, null: false
      t.date :registration_start_date, null: false
      t.date :registration_end_date, null: false
      t.string :address, null: false
      t.string :ship_name, null: false
      t.text :administrator, null: false
      t.date :insurance_start_date, null: false
      t.date :insurance_end_date, null: false

      t.timestamps
    end
  end
end
