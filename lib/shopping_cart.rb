class ShoppingCart
  attr_reader :line_items

  def initialize
    @line_items = []
  end

  def add(product, quantity: 1)
    @line_items << LineItem.new(product, quantity: quantity)
  end

  def receipt
    str = ""
    @line_items.each do |line_item|
      str += "#{line_item.quantity} #{line_item.product.name}: #{formatted_number(line_item.total_with_taxes)}\n"
    end
    str += "\n"
    str += "Sales Taxes: #{formatted_number(line_items_total_sale_taxes)}\n"
    str += "Total: #{formatted_number(line_items_total)}\n"
    str
  end

  private

  def line_items_total
    @line_items.map(&:total_with_taxes).inject(&:+).round(2)
  end

  def line_items_total_sale_taxes
    @line_items.map(&:total_taxes).inject(&:+).round(2)
  end

  def formatted_number(number)
    sprintf('%.2f', number)
  end
end
