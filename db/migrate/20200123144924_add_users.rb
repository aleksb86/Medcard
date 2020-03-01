class AddUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :phone
      t.string :password_digest, null: false
      t.boolean :active, default: true, null: false
      t.timestamps
      t.index :email, unique: true
      t.index :phone, unique: true
    end
  end
end
