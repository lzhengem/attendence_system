class Session < ActiveRecord::Base
  belongs_to :section
  has_many :attendances, dependent: :destroy
  has_many :students, through: :section
  # attr_accessor :date
  
  #takes in an array of student_ids and adds it to the session
  def add_student_attendance(student_ids)
  
  #this needs to update the attendances to true
    # student_ids.each do |student_id|
    #   @student = Student.find(student_id)
    #   attendances.create(student: @student, present: true)
    # end
  end
  
  def initialize_student_attendance(student_ids)
      student_ids.each do |student_id|
      # @student = Student.find(student_id)
      
      # find all the students for this session that does not an attendance record
      # and create an attendance record for them
      unless attendances.pluck(:student_id).include?(student_id) then attendances.create(student: @student, present: false) end
    end
  end
end
