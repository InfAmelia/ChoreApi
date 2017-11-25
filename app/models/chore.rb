class Chore < ApplicationRecord
  has_many :chore_assignments
  has_many :users, through: :chore_assignments

  def assigned_to
    chore_assignments.last.user
  end
end
