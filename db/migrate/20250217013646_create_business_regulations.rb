class CreateBusinessRegulations < ActiveRecord::Migration[8.0]
  def change
    create_table :business_regulations do |t|
      t.string :title, null: false, index: { unique: true }
      t.string :subtitle, null: false, index: { unique: true }
      t.integer :page_num, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
