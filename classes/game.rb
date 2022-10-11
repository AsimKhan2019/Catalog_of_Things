require 'date'
require_relative './items'
require_relative './game'
require_relative './author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :game_name

  def initialize(game_name, multiplayer, last_played_at)
    super(publish_date)
    @game_name = game_name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    date = DateTime.parse(@last_played_at).to_date
    archived = (Date.today.year - date.year) > 2
    super && archived
  end
end
