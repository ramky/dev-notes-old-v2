class AddNoteTypeToNotes < ActiveRecord::Migration[5.0]
  def up
    add_column :notes, :note_type, :note_type, index: true
  end

  def down
    remove_column :notes, :note_type
  end
end
