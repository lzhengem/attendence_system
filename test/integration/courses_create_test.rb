require 'test_helper'

class CoursesCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @course = courses(:programming)
  end
  
  test "should not save an invalid course" do
    get new_course_path
  
    #there is a course with crn 111 in course.yml already
    assert_no_difference "Course.count" do
      post courses_path, course: {crn: '111', title: 'something', section:'1'}
    
    end
    assert_template 'new'
    assert_select "div.alert", "The form contains 1 error:"
  
  end
end
