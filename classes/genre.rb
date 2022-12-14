class Genre
  attr_reader :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1...700)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.genre = self
  end
end
