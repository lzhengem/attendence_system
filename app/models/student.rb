class Student < ActiveRecord::Base
    has_many :rosters
    has_many :courses, through: :rosters
    
    def add_course(course)
        self.courses << course
    end
end
