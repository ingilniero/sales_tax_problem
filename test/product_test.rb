require_relative "./test_helper"

class ProductTest < Minitest::Test
  def test_product
    assert Product.new
  end

  def test_accepts_attributes
    assert Product.new(name: "book", price: 12.49)
  end

  def test_can_access_name
    product =  Product.new(name: "book")
    assert_equal "book", product.name
  end

  def test_can_access_price
    product =  Product.new(price: 12.49)
    assert_equal 12.49, product.price
  end
end
