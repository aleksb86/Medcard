class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true, unique: true
      t.string :color
      t.timestamps
    end
  end
end
