class Course < ActiveRecord::Base
    has_many :sections
    has_many :students, -> { distinct }, through: :sections
    validates :crn, presence: true, uniqueness: true
    
    #creates a new section for this course
    def add_section(num_sections = 0)
        num_sections.to_i.times do
            sections << Section.create
        end
    end
end
