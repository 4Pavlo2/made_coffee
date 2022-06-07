class CoffeeMaker
  COFFEE_TYPES = %w[americano_5$ cappuccino_10$ latte_7$].freeze

  attr_accessor :water, :coffee, :sugar, :milk, :bank

  def initialize
    @water = 1000
    @coffee = 100
    @sugar = 100
    @milk = 100
    @bank = 0
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
    end
  end

  private

  def make_americano
    self.water -= 50
    self.coffee -= 5
    self.bank += 5
    sleep(1)
    puts "Enjoy your Americano ;)\n\n"
  end

  def make_cappuccino
    self.water -= 500
    self.coffee -= 5
    self.sugar -= 5
    self.milk -= 5
    self.bank += 10
    sleep(5)
    puts "Enjoy your Latte :)\n\n"
  end

  def make_latte
    self.water -= 50
    self.coffee -= 5
    self.sugar -= 5
    self.milk -= 5
    self.bank += 7
    sleep(3)
    puts "Enjoy your Cappuccino :0\n\n"
  end

  def enoght_ingridients?
    [water, coffee, sugar, milk].any? { |ingridient| ingridient.zero? || ingridient.negative? }
  end

  def show_capicity(admin)
    case admin
    when 'coffee'
      puts "\ncurrent capicity: \nwater: #{water}, coffee: #{coffee}, sugar: #{sugar}, milk: #{milk}\n\nbank: #{bank}$\n"
    when '9'
      puts "if u don`t want sleep, You are welcome enjoy our coffee again\n\n\n"
      exit
    end
  end
end

CoffeeMaker.new.menu