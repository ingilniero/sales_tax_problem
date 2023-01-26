require_relative "./test_helper"

class LineItemTest < Minitest::Test
  def test_line_item
    product = Product.new(price: 10)
    assert LineItem.new(product, quantity: 1)
  end

  def test_line_item_total
    product = Product.new(price: 10)
    line_item = LineItem.new(product, quantity: 1)

    assert_equal 10, line_item.total


    product = Product.new(price: 10)
    line_item = LineItem.new(product, quantity: 2)

    assert_equal 20, line_item.total
  end

  def test_total_with_taxes
    product = Product.new(price: 10)
    line_item = LineItem.new(product, quantity: 2)

    assert_equal 11, line_item.product_price_with_taxes
  end

  def test_total_with_taxes
    product = Product.new(name: "imported bottle of perfume", price: 47.50)
    line_item = LineItem.new(product, quantity: 1)

    assert_equal 54.65, line_item.total_with_taxes
  end
end
