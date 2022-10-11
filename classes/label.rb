class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1...100)
    @title = title
    @color = color
    @items = []
  end

  def add_items(items)
    @items << items
    items.label = self
  end
end
