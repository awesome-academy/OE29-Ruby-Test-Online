class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.datetime :time_end
      t.integer :language, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
