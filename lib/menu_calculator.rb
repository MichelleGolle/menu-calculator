require 'bigdecimal'
require 'bigdecimal/util'

class MenuCalculator

  attr_accessor :file, :items

  def initialize(file)
    @file = IO.readlines(file)
    @running_total = BigDecimal.new(0)
    @items = []
  end

  def goal_total
    BigDecimal.new(file[0].gsub('$', ''))
  end

  def menu_items_hash
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

  def items_combo
    menu_items_hash.each do |key, value|
      return @items if @running_total == goal_total
      if @running_total + value <= goal_total
        @items << key
        @running_total += value
        items_combo
      end
    end
    if @items.empty?
      output = "No available combinations"
    else
      output = @items
    end
    output
  end

end

calculator = MenuCalculator.new('../data/bigger_sample.txt')
puts calculator.items_combo
