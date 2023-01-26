require_relative "./test_helper"

class ShoppingCartTest < Minitest::Test
  def test_shopping_cart
    assert ShoppingCart.new
  end

  def test_can_add_products
    cart = ShoppingCart.new
    product = Product.new(price: 10)

    cart.add(product)

    assert_equal 1, cart.line_items.size
  end

  def test_print_receipt_no_decimals
    cart = ShoppingCart.new
    product = Product.new(name: "book", price: 10)

    cart.add(product)

    assert_equal(<<~RECEIPT, cart.receipt)
    1 book: 10.00

    Sales Taxes: 0.00
    Total: 10.00
    RECEIPT
  end

  def test_print_receipt_with_decimals
    cart = ShoppingCart.new
    product = Product.new(name: "music CD", price: 14.99)

    cart.add(product)

    assert_equal(<<~RECEIPT, cart.receipt)
    1 music CD: 16.49

    Sales Taxes: 1.50
    Total: 16.49
    RECEIPT
  end

  def test_receipt_with_basic_tax_sale
    cart = ShoppingCart.new
    product1 = Product.new(name: "book", price: 12.49)
    product2 = Product.new(name: "music CD", price: 14.99)
    product3 = Product.new(name: "chocolate bar", price: 0.85)

    cart.add(product1, quantity: 2)
    cart.add(product2, quantity: 1)
    cart.add(product3, quantity: 1)

    assert_equal(<<~RECEIPT, cart.receipt)
    2 book: 24.98
    1 music CD: 16.49
    1 chocolate bar: 0.85

    Sales Taxes: 1.50
    Total: 42.32
    RECEIPT
  end

  def test_receipt_with_import_duties
    cart = ShoppingCart.new
    product1 = Product.new(name: "imported box of chocolates", price: 10)
    product2 = Product.new(name: "imported bottle of perfume", price: 47.50)

    cart.add(product1, quantity: 1)
    cart.add(product2, quantity: 1)

    assert_equal(<<~RECEIPT, cart.receipt)
    1 imported box of chocolates: 10.50
    1 imported bottle of perfume: 54.65

    Sales Taxes: 7.65
    Total: 65.15
    RECEIPT
  end

  def test_receipt_with_sale_taxes_and_import_duties
    cart = ShoppingCart.new
    product1 = Product.new(name: "imported bottle of perfume", price: 27.99)
    product2 = Product.new(name: "bottle of perfume", price: 18.99)
    product3 = Product.new(name: "packet of headache pills", price: 9.75)
    product4 = Product.new(name: "imported box of chocolates", price: 11.25)

    cart.add(product1, quantity: 1)
    cart.add(product2, quantity: 1)
    cart.add(product3, quantity: 1)
    cart.add(product4, quantity: 3)

    assert_equal(<<~RECEIPT, cart.receipt)
    1 imported bottle of perfume: 32.19
    1 bottle of perfume: 20.89
    1 packet of headache pills: 9.75
    3 imported box of chocolates: 35.55

    Sales Taxes: 7.90
    Total: 98.38
    RECEIPT
  end
end
