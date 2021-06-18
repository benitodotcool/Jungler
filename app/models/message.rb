class Message < ApplicationRecord

  belongs_to :conversation
  has_many :messages 

  belongs_to :sender_id, class_name: 'User'
end
