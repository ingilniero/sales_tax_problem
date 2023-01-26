require_relative "./test_helper"

class TaxCalculatorTest < Minitest::Test

  def test_calculator
    assert TaxCalculator.new
  end

  def test_basic_sale_tax_of_10_percent
    product = Product.new(price: 10)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 11, sale_tax
  end

  def test_basic_sale_tax_for_all_goods
    product = Product.new(price: 12.49)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 13.73, sale_tax
  end

  def test_no_sale_tax_for_books
    product = Product.new(name: "book", price: 12.49)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 12.49, sale_tax
  end

  def test_no_sale_tax_for_food
    product = Product.new(name: "chocolate bar", price: 0.85)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 0.85, sale_tax
  end

  def test_no_sale_tax_for_medical_products
    product = Product.new(name: "packet of headache pills", price: 9.75)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 9.75, sale_tax
  end

  def test_import_duty_tax_all_goods
    product = Product.new(name: "imported bottle of perfume", price: 27.99)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 32.16, sale_tax
  end

  def test_import_duty_tax_for_food
    product = Product.new(name: "imported box of chocolates", price: 10.00)

    calculator = TaxCalculator.new
    sale_tax = calculator.calculate_sale_tax(product)

    assert_equal 10.5, sale_tax
  end
end
