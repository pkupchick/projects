class Employee
    
    attr_reader :name
    attr_accessor :salary, :title, :boss, :manager
    
    def initialize(name, salary, title, manager=nil)
        @name, @salary, @title, @manager = name, salary, title, manager
    end

    def bonus(muliplier)
        self.manager.nil? ? puts "Your bonus is top secret" : muliplier * self.salary
    end


end