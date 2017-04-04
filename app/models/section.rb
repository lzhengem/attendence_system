class Section < ActiveRecord::Base
    belongs_to :course
    has_many :section_students, dependent: :destroy
    has_many :students, -> { distinct }, through: :section_students
    
    
    #adds students to sections. this expects an array of student ids
    def add_students(student_ids)
        student_ids.each do |student_id|
            student = Student.find_by(id: student_id)
            students << student
        end
    end
    
    def remove_students(student_ids)
        student_ids.each do |student_id|
            student = Student.find_by(id: student_id)
            students.delete(student)
        end
    end
    
    # def add_student(student_id)
    #     student = Student.find_by(id: student_id)
    #     students << student
    # end
    
    # def remove_student(student_id)
    #     student = Student.find_by(id: student_id)
    #     students.delete(student)
    # end
end
