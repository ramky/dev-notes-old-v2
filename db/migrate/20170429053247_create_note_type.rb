class CreateNoteType < ActiveRecord::Migration[5.0]
  def up
   execute <<-EOF
      CREATE TYPE note_type AS ENUM ('dev_note', 'address', 'vim_note', 'markdown', 'quote');
    EOF
  end

  def down
    execute <<-EOF
      DROP TYPE note_type;
    EOF
  end
end
