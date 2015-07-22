require 'minitest/autorun'
require 'minitest/pride'
require_relative 'menu_calculator'

class MenuCalculatorTest < Minitest::Test
  def test_it_reads_a_file
    calculator = MenuCalculator.new
    assert_equal 7, calculator.read("sample.txt").length
  end
end
