require_relative './classes/items'
class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :items

  def initialize(publish_date, on_spotify, name)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    super && @on_spotify
  end
end
