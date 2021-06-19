class Message < ApplicationRecord

  belongs_to :conversation
  has_many :messages 
  belongs_to :user
  
end
