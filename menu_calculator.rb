class MenuCalculator

  attr_accessor :file

  def initialize(file)
    @file = IO.readlines(file)
  end

  def total
    file[0].gsub('$', '').to_f * 100
  end

calculator = MenuCalculator.new("sample.txt")
puts calculator.total

end
