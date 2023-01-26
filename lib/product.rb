class Product
  attr_reader :name, :price

  def initialize(name: nil, price: 0)
    @name = name
    @price = price
  end
end
