class Dataset < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :original_name, presence: true
  validates :storage_key, presence: true
end
