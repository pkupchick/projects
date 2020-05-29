require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup_2)
        @funding > startup_2.funding
    end

    def hire(emp_name, title)
        if salaries.has_key?(title)
            employees << Employee.new(emp_name, title)
        else
            raise "ERROR"
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        amount = salaries[employee.title]
        raise "not enough funding" if amount > @funding
        employee.pay(amount)
        @funding -= amount
    end

    def payday
        employees.each do |worker|
            pay_employee(worker)
        end
    end

    def average_salary
        count = 0
        @employees.each do |worker|
            count += @salaries[worker.title]
        end
        count / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each do |title, pay|
            if !@salaries.has_key?(title)
                @salaries[title] = pay
            end
        end
        
        startup_2.employees.each do |worker|
            @employees << worker
        end

        startup_2.close
    end
end

