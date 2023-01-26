class LineItem
  attr_reader :product, :quantity

  def initialize(product, quantity: 1)
    @product = product
    @quantity = quantity
  end

  def total
    product.price * quantity
  end

  def total_with_taxes
    (product_price_with_taxes * quantity).round(2)
  end

  def total_taxes
    tax_calculator.calculate_sale_tax(product) * quantity
  end

  def product_price_with_taxes
    product.price + tax_calculator.calculate_sale_tax(product)
  end

  private

  def tax_calculator
    @tax_calculator ||= TaxCalculator.new
  end
end
