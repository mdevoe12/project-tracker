class AddContentToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :content, :text
  end
end
