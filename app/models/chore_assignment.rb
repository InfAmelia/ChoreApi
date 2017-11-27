class ChoreAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :chore

  #fields do
    # active: boolean
    scope :active, -> { where(active: true) }
    scope :not_active, -> { where(active: false) }

end
