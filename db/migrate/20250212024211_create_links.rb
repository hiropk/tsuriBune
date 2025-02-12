class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end
  end
end
