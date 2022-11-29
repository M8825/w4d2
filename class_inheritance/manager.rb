require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    bonus = (@employees.inject(self.salary) { |acc, ele| acc + ele.salary }) * multiplier

    bonus
  end

end

ned = Manager.new("Ned", "kitchen", 1000000)

darren = Manager.new('Daren', 'kitchen', 78000, ned)
shawna = Employee.new('shawna', 'kitchen', 12000, darren)
david = Employee.new('David', 'kitchen', 10000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000