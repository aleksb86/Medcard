class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.date :birth_date
      t.string :chronic_diseases
      t.string :vital_medicines
      t.string :disability_group_details
      t.string :allergy_to_drugs
      t.integer :disability_group
      t.integer :blood_type
      t.uuid :uid
      t.timestamps
      t.index :uid, unique: true
    end
  end
end
