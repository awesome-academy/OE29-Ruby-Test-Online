class AddRoleToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :role, :int
  end
end
