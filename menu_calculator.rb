require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'

class MenuCalculator

  attr_accessor :file, :items

  def initialize(file)
    @file = IO.readlines(file)
    @running_total = BigDecimal.new(0)
    @items = []
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

  def calculate
    parse.each do |key, value|
      # binding.pry
      return if @running_total == total
      if @running_total + value <= total
        @items << key
        @running_total += value
        calculate
      end
      if @running_total == 0
        puts "No available combinations"
      else
        puts "Total Bill: $#{@running_total.to_f} Items: #{@items}"
      end
    end
  end
end
