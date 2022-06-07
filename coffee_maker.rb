class CoffeeMaker
  COFFEE_TYPES = %w[americano cappuccino latte].freeze

  attr_accessor :water, :coffee, :sugar, :milk

  def initialize
    @water = 1000
    @coffee = 100
    @sugar = 100
    @milk = 100
  end

  def make(coffee_type)
    case coffee_type
    when '1'
      make_americano
    when '2'
      make_cappuccino
    when '3'
      make_latte
    else
      puts 'I don`t know this coffee'
    end
  end

  def menu
    loop do
      puts 'Select coffee: '
      COFFEE_TYPES.each.with_index(1) { |type,index| puts "\n#{index} - #{type}" }
      make(gets.chomp)
      break(puts 'not enougth ingridients') if enoght_ingridients?

      puts "show capicity of current ingridients, enter pass\nI just want new coffee, push 8\nI don`t want sleep, push 9"
      show_capicity(gets.chomp)
      break(puts 'if u don`t want sleep, You are welcome enjoy our coffee again') if '9'
    end
  end

  private

  def make_americano
    self.water -= 50
    self.coffee -= 5
    puts "Enjoy your Americano\n"
  end

  def make_latte
    self.water -= 50
    self.coffee -= 5
    self.sugar -= 5
    puts "Enjoy your Cappuccino\n\n"
  end

  def make_cappuccino
    self.water -= 500
    self.coffee -= 5
    self.sugar -= 5
    self.milk -= 5
    puts "Enjoy your Latte\n"
  end

  def enoght_ingridients?
    [water, coffee, sugar, milk].any? { |ingridient| ingridient.zero? || ingridient.negative? }
  end

  def show_capicity(admin)
    case admin
    when 'coffee'
      puts "\nwater: #{water}, coffee: #{coffee}, sugar: #{sugar}, milk: #{milk}\n"
    end
  end
end

CoffeeMaker.new.menu