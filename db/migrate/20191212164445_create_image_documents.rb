class CreateImageDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :image_documents do |t|
      t.string :name
      t.string :md5, index: true, unique: true
      t.timestamps
      t.references :note, index: true, foreign_key: true
    end
  end
end
