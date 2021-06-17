class Match < ApplicationRecord

  belongs_to :requestor, class_name: 'User'
  belongs_to :receiver , class_name: 'User'

  validates :receiver_id, presence: true
  validates :requestor_id, presence:true #Tododev : voir pour valider que requestor_id doit être différent que receiver_id
  

end
