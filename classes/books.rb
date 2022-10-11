require_relative 'items'

class Book < Item
  attr_accessor :publisher :cover_state

  def initialize(publisher = 'Unknown', publish_date, cover_state = 'Unknown')
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
