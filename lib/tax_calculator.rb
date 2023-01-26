class TaxCalculator
  BASE_SALE_TAX = 0.10
  IMPORT_DUTY_TAX = 0.05

  def calculate_sale_tax(product)
    price = product.price

    taxes = sale_tax(product)
    taxes += import_duty_tax(product)
    return taxes if taxes.zero?

    round_to_the_nearest_0_5(taxes.round(2))
  end

  private

  def sale_tax(product)
    return 0 if excluded_product_type?(product.type)

    (product.price * BASE_SALE_TAX).round(2)
  end

  def import_duty_tax(product)
    return 0 unless product.imported?

    (product.price * IMPORT_DUTY_TAX).round(2)
  end

  def excluded_product_type?(type)
    %w(Book Food MedicalProduct).include?(type)
  end

  def round_to_the_nearest_0_5(tax)
    decimal = tax * 100 % 5
    return tax if decimal.zero?

    if ((((tax).floor - tax).abs) * 10) > 5
      ((((tax * 10).ceil / 10.0)) * 10) / 10.0
    else
      ((((tax * 10).floor / 10.0) + 0.05) * 10) / 10.0
    end
  end
end
