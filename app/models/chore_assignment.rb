class ChoreAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :chore
end