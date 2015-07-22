require 'minitest/autorun'
require 'minitest/pride'
require_relative 'menu_calculator'

class MenuCalculatorTest < Minitest::Test
  def test_it_reads_a_file
    calculator = MenuCalculator.new("sample.txt")
    assert_equal 7, calculator.file.length
  end

  def test_it_returns_total
    calculator = MenuCalculator.new("sample.txt")
    assert_equal "0.1505E2", calculator.total.to_s
  end

  def test_food_items_point_to_price
    calculator = MenuCalculator.new("sample.txt")
    assert_equal "0.275E1", calculator.parse["french fries"].to_s
  end
end
