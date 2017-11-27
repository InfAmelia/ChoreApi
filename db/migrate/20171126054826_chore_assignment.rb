class ChoreAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :chore_assignments, :active, :boolean
  end
end
