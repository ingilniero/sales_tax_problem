class Product
  attr_reader :name, :price, :type

  def initialize(name: nil, price: 0)
    @name = name
    @price = price
    @type = set_type
    @imported = tag_imported
  end

  def imported?
    @imported
  end

  private

  def set_type
    case name
    in "book"
      "Book"
    in /.*chocolate.*/
      "Food"
    in /.*pill.*/
      "MedicalProduct"
    else
      "Unknown"
    end
  end

  def tag_imported
    @imported = name&.include?("imported")
  end
end
