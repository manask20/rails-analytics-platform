class JobAttempt < ApplicationRecord
  belongs_to :job

  validates :attempt_no, numericality: { only_integer: true, greater_than: 0 }
end
