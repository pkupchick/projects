require_relative "Manager.rb"

class Employee
    
    attr_reader :name
    attr_accessor :salary, :title, :boss
    
    def initialize(name, salary, title, boss = nil)
        @name, @salary, @title = name, salary, title
        self.boss = boss
    end

    def bonus(muliplier)
        muliplier * self.salary
    end

end

class Manager < Employee
    attr_reader :employees
    def initialize(name, salary, title, boss = nil)
        super(name, salary, title, boss)
        
        @employees = []
    end

    def add_employee(worker)
        employees << worker
    end

    def bonus(multiplier)
        payday = 0
        self.employees.each do |employee|
            payday += employee.salary * multiplier
        end
        payday
    end

end



ned = Manager.new("Ned", 1_000_000, "Founder")
phil = Manager.new("Phil", 300_000, "Manager", "Ned")
lisa = Manager.new("Lisa", 150_000, "SWE", "Phil")
john = Employee.new("John", 100_000, "SWE", "Phil")

# p ned

phil.add_employee(lisa)
phil.add_employee(john)
p phil

# p john.bonus(2)
p phil.bonus(0.25)
# p john
# Name	Salary	Title	Boss
# Ned	\$1,000,000	Founder	nil
# Darren	\$78,000	TA Manager	Ned
# Shawna	\$12,000	TA	Darren
# David	\$10,000	TA	Darren