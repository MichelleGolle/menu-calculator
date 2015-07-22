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
    assert_equal 1505, calculator.total
  end
end
