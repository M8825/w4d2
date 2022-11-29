class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    boss.employees << self if !boss.nil?
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
    bonus
  end
end