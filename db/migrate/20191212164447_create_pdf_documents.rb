class CreatePdfDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :pdf_documents do |t|
      t.string :name, null: false
      t.string :md5, null: false
      t.timestamps
      t.references :note, index: true, foreign_key: true
      t.index :md5, unique: true
    end
  end
end
