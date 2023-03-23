class Conversation < ApplicationRecord
    belongs_to :customer
    validates :conversation, presence: true
end
