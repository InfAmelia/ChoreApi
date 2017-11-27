class Chore < ApplicationRecord
  has_many :chore_assignments
  has_many :users, through: :chore_assignments

  def rotate!(user)
    # find first active chore assignment for given user
    if (assignment = chore_assignments.active.find_by(user: user, chore: self))
      # set to false, this has the effect of popping from the queue without losing the history of who did what chore when
      assignment.update_attribute(:active, false)
    end

    # create a new chore assignment at the end of the queue
    ChoreAssignment.create!(chore: self, user: user, active: true)
  end

  def users_ordered
    chore_assignments.active.map do |assignment|
      assignment.user 
    end
  end

  def assigned_to
    chore_assignments.last.user
  end
end
