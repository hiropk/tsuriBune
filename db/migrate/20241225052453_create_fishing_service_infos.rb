class CreateFishingServiceInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :fishing_service_infos do |t|
      t.string :name
      t.integer :pref
      t.integer :number
      t.date :registration_start_date
      t.date :registration_end_date
      t.string :address
      t.string :ship_name
      t.text :administrator
      t.date :insurance_start_date
      t.date :insurance_end_date

      t.timestamps
    end
  end
end
