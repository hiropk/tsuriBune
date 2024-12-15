class CreatePageContents < ActiveRecord::Migration[8.0]
  def change
    create_table :page_contents do |t|
      t.integer :display_page
      t.string :head
      t.text :contents

      t.timestamps
    end
  end
end
