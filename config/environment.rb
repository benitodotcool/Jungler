# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

client = RiotGamesApiClient::Client.new(
  api_key: ENV['RIOT_API_KEY'],
  region: "euw1"
 ) 