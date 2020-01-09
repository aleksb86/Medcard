class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :kind, null: false, default: 0
      t.references :card, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.bigint :parent_id, index: true
      t.timestamps
    end
  end
end
