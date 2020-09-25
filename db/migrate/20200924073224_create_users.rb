class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :gender, null:false, default: 0
      t.datetime :birthday
      t.integer :role, null: false, default: 0
      t.integer :language, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
