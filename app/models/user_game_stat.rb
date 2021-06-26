class UserGameStat < ApplicationRecord

belongs_to :user, dependent: :destroy

validates :level, presence: true, numericality: { greater_than: 0, less_than: 3100 }, on: :update
validates :summoner_id,length: {maximum: 63}, on: :update

  
end
