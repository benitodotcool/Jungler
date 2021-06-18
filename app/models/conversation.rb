class Conversation < ApplicationRecord


  belongs_to :participant_a, class_name: 'User'
  belongs_to :participant_b, class_name: 'User'

  # validates_uniqueness_of :participant_a, scope: [:participant_a, :participant_b]

  validates :participant_a, presence: true
  validates :participant_b, presence: true
   
  
end
