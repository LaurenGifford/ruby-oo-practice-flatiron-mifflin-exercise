
class Role

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select{|employee| employee.role == self}
    end

    def managers
        self.employees.map(&:manager).uniq
    end

    def add_employee(name, salary, manager)
        Employee.new(name, salary, manager)
    end

end