class UserGameStat < ApplicationRecord

belongs_to :user, dependent: :destroy

validates :level, presence: true, numericality: { greater_than: 0, less_than: 3100 }
validates :summoner_id,length: {maximum: 63}
validates :primary_role, presence: true 
validates :secondary_role, presence: true
validates :description, presence: true, length: {minimum: 30, maximum: 280}

end
