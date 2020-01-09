class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|
      t.string :description
      t.references :examination_type, index: true, foreign_key: true
      t.references :note, index: true, foreign_key: true
      t.timestamps
    end
  end
end
