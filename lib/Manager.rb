class Manager
    attr_accessor :name, :department, :age

    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select{|employee| employee.manager == self}
    end

    def roles
        self.employees.map(&:role)
    end

    def self.all_departments
        self.all.map(&:department).uniq
    end

    def self.average_age
        self.all.sum(&:age)/self.all.count.to_f
    end
end
