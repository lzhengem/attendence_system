class Student < ActiveRecord::Base
    has_many :section_students #this table is to maintain the has_and_belongs_to_many relationship
    has_many :sections, through: :section_students
    has_many :courses, -> { distinct }, through: :sections
    
end
