class TaxCalculator
  BASE_SALE_TAX = 0.10
  IMPORT_DUTY_TAX = 0.05

  def calculate_sale_tax(product)
    price = product.price

    subtotal = price + sale_tax(product)
    subtotal += import_duty_tax(product)
    subtotal.floor(2)
  end

  private

  def sale_tax(product)
    return 0 if excluded_product_type?(product.type)

    (product.price * BASE_SALE_TAX).floor(2)
  end

  def import_duty_tax(product)
    return 0 unless product.imported?

    (product.price * IMPORT_DUTY_TAX).floor(2)
  end

  def excluded_product_type?(type)
    %w(Book Food MedicalProduct).include?(type)
  end
end
