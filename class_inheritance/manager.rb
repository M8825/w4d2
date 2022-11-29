require_relative 'employee'
require "debug"

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

      all_employees += employee.employees if employee.is_a?(Manager)
      all_employees << employee

    end
    all_employees.inject(0) { |sum, employee| sum + employee.salary } * multiplier
  end

end

ned = Employee.new('Ded', 'kitchen', 5, 'Daren')
daren = Manager.new('Daren', 'kitchen', 10, 'Fred')
david = Employee.new('David', 'kitchen', 5, 'Daren')

daren.add_employee(ned)
daren.add_employee(david)
