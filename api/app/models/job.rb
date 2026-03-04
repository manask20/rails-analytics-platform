class Job < ApplicationRecord
  belongs_to :dataset
  has_many :job_attempts, dependent: :destroy

  JOB_TYPES = %w[word_count groupby_sum top_k].freeze
  STATUSES  = %w[queued running succeeded failed dead].freeze

  validates :job_type, presence: true, inclusion: { in: JOB_TYPES }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :progress, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  # Optional helper methods (good for interviews)
  def mark_running!
    update!(status: "running", started_at: Time.current)
  end

  def mark_succeeded!
    update!(status: "succeeded", progress: 100, finished_at: Time.current)
  end

  def mark_failed!
    update!(status: "failed", finished_at: Time.current)
  end
end
