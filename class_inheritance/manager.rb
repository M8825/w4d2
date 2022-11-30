require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    all_employees = [] 

    @employees.each do |employee|
      all_employees << employee
      all_employees += employee.employees if employee.is_a?(Manager)
    end

    all_employees.inject(0) { |sum, employee| sum + employee.salary } * multiplier
  end

end

ned = Manager.new("Ned", "CEO", 1000000)

darren = Manager.new('Daren', 'kitchen', 78000, ned)
shawna = Employee.new('Shawna', 'kitchen', 12000, darren)
david = Employee.new('David', 'kitchen', 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
