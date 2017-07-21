class CreateNoteStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :note_statuses do |t|
      t.references :note, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
