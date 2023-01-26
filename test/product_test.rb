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

  def test_can_get_the_product_type_based_on_the_name
    product =  Product.new
    assert_equal "Unknown", product.type

    product =  Product.new(name: "book", price: 12.49)
    assert_equal "Book", product.type

    product =  Product.new(name: "music CD", price: 12.49)
    assert_equal "Unknown", product.type

    product =  Product.new(name: "chocolate bar", price: 12.49)
    assert_equal "Food", product.type

    product =  Product.new(name: "imported box of chocolates", price: 12.49)
    assert_equal "Food", product.type

    product =  Product.new(name: "imported bottle of perfume", price: 12.49)
    assert_equal "Unknown", product.type

    product =  Product.new(name: "packet of headache pills", price: 12.49)
    assert_equal "MedicalProduct", product.type
  end

  def test_tag_imported_product
    product =  Product.new(name: "book", price: 12.49)
    refute product.imported?

    product =  Product.new(name: "imported book", price: 12.49)
    assert product.imported?
  end
end
