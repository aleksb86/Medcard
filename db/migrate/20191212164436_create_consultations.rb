class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.string :doctor_full_name
      t.string :doctor_speciality
      t.string :ds
      t.string :description
      t.references :note, index: true, foreign_key: true
      t.timestamps
    end
  end
end
