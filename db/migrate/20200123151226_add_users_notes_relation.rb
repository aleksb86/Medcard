class AddUsersNotesRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :user, index: true, foreign_key: true
  end
end
