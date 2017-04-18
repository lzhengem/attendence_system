class Session < ActiveRecord::Base
  belongs_to :section
  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances
  # attr_accessor :date
  
  def add_student_attendance(student_ids)
  
    student_ids.each do |student_id|
      @student = Student.find(student_id)
      attendances.build(student: @student, present: true)
    end
    save
    
    
  end
end
