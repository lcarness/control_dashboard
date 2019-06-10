class AddNoteCountToInputs < ActiveRecord::Migration[5.1]
  def change
    add_column :inputs, :notes_count, :integer
  end
end
