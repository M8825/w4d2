require_relative 'employee'

class Manager < Employee
  def initialize
    @employees = []
  end

  def bonus(multiplier)
    bonus = (@employees.inject { |acc, ele| acc += ele.salary }) * multiplier

    bonus
  end

  def add_employee(employee)
    @employees.include?(employee) ? return nil : @employees << employee
  end
end

ned = Employee.new('Ded', 'kitchen', 5, 'Daren')
daren = Manager.new('Daren', 'kitchen', 10, 'Fred')
david = Employee.new('David', 'kitchen', 5, 'Daren')

daren.add_employee(ned)
daren.add_employee(david)
