class Work < ApplicationRecord
  belongs_to :customer
  validates :job, :price, :status, presence: true
end
