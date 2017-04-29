class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
