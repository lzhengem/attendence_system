class Session < ActiveRecord::Base
  belongs_to :section
  has_many :attendances, dependent: :destroy
  has_many :students, through: :section
  # attr_accessor :date
  
  #takes in an array of student_ids and adds it to the session
  # def add_student_attendance(student_ids)
  
  # #this needs to update the attendances to true
  #   # student_ids.each do |student_id|
  #   #   @student = Student.find(student_id)
  #   #   attendances.create(student: @student, present: true)
  #   # end
  # end
  
  def update_student_attendance(present_student_ids)
    attendances.each do |attendance|
      # if the student is one of the present_student_ids, then change their present to true
      present_student_ids.include?(attendance.student_id.to_s) ? attendance.update_attribute(:present, true) : attendance.update_attribute(:present, false)
    end
    
  end
  
  
  def initialize_student_attendance(student_ids)
      student_ids.each do |student_id|
      # @student = Student.find(student_id)
      
      # find all the students for this session that does not an attendance record
      # and create an attendance record for them
      unless attendances.select(:student_id).include?(student_id) then attendances.create(student_id: student_id, present: false) end
    end
  end
end
