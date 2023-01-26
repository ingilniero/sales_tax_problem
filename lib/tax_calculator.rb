class TaxCalculator
  BASE_SALE_TAX = 0.10

  def calculate_sale_tax(product)
    price = product.price

    return price if excluded_product_type?(product.type)

    price + sale_tax(price)
  end

  private

  def sale_tax(price)
    (price * BASE_SALE_TAX).floor(2)
  end

  def excluded_product_type?(type)
    %w(Book Food MedicalProduct).include?(type)
  end
end
