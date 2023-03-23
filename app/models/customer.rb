class Customer < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
