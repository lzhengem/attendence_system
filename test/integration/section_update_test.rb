require 'test_helper'

class SectionUpdateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @student = students(:sakura)
  end
  
  test "add student to course" do
    get new_course_path
    #create a new course with 1 section
    post courses_path, course: {crn: 123, title: "dancing", add_section: 1}
    
    @new_course = Course.last
    @section = @new_course.sections.first
    
    #there should be no students in the course
    assert_equal @section.students.count, 0 
    
    #add 1 student to the course
    get edit_section_path(@section)
    patch section_path(@section), section: {student_ids: [@student.id]}
    
    #there should be 1 student in @section
    assert_equal @section.students.count, 1
    
  end
end
