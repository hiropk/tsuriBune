class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :embarkation_type
      t.integer :unit_price
      t.integer :acceptable_num
      t.integer :payment_method

      t.timestamps
    end
  end
end
