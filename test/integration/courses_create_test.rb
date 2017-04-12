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
      post courses_path, course: {crn: '111', title: 'something', add_section:1}
    
    end
    assert_template 'new'
    assert_select "div.alert", "The form contains 1 error:"
  
  end
  
  test "should save valid course" do
    get new_course_path
    
    #create new course with 5 sections, make sure courses increase by 1 and section increases by 5
    assert_difference "Course.count", 1 do
      assert_difference "Section.count", 5 do
        post courses_path, course: {crn: '123', title: 'dancing', add_section: 5}
      end
    end
    
    #check if get redirected back to index with a flash
    assert_redirected_to courses_path
    follow_redirect!
    assert_not flash.empty?
  end
end
