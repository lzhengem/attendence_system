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
    
    # def add_students(student_ids)
    #     students_to_add = []
    #     student_ids.each do |student_id|
    #         students_to_add << Student.find_by(id: student_id)
    #     end
    #     students << students_to_add.flatten
    # end
    
    # def remove_students(student_ids)
    #     students_to_remove = []
    #     student_ids.each do |student_id|
    #         students_to_remove << Student.find_by(id: student_id)
    #     end
    #     students.delete(students_to_remove.flatten)
    # end
    
    
end
