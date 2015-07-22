require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'

class MenuCalculator

  attr_accessor :file

  def initialize(file)
    @file = IO.readlines(file)
  end

  def total
    BigDecimal.new(file[0].gsub('$', ''))
  end

  def parse
    hash = Hash.new
    file.map do |line|
      split_line = line.split(',')
      if split_line.length > 1
        food = split_line[0]
        price = split_line[1]
        hash[food] = BigDecimal.new(price.gsub('$', ''))
      end
    end
    hash
  end

end
