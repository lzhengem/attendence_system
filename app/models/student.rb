class Student < ActiveRecord::Base
    has_many :section_students
    has_many :sections, through: :section_students
    has_many :courses, through: :sections
    
    # has_many :courses, through: :rosters
    
    # def add_course(course)
    #     self.courses << course
    # end
end
