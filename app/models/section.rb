class Section < ActiveRecord::Base
    belongs_to :course
    has_many :section_students
    has_many :students, through: :section_students
end
