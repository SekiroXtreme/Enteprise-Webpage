class Work < ApplicationRecord
  belongs_to :customer
  validates :job, :price, :status, presence: true
  JOBS = [:plumbing, :electricity, :brickwork, :painting, :misc]
  STATUS = [:working, :finished, :pending]
end
