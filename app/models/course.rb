class Course < ActiveRecord::Base
    has_many :sections
    # has_many :students, through: :rosters
    validates :crn, presence: true, uniqueness: true
    
    # def add_student(student)
    #     self.students << student
    # end
end
