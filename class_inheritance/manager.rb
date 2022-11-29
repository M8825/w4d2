require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  # take my salary
  # take my employees' salaries and it's employees' salaries

  def bonus(multiplier)
    all_employees = [] # Object emplyee
    @employees.each do |employee|
      if employee.is_a?(Manager)
        all_employees += employee.employees
      end
    end

    all_employees.inject(self.salary) { |sum, employee| sum + employee.salary } * multiplier
  end

end

ned = Manager.new("Ned", "kitchen", 1000000)

darren = Manager.new('Daren', 'kitchen', 78000, ned)
shawna = Employee.new('shawna', 'kitchen', 12000, darren)
david = Employee.new('David', 'kitchen', 10000, darren)


# 22 000 + 78000

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000