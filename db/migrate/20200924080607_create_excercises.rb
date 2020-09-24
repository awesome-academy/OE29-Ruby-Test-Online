class CreateExcercises < ActiveRecord::Migration[6.0]
  def change
    create_table :excercises do |t|
      t.integer :id_a
      t.integer :id_q
      t.integer :check
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
