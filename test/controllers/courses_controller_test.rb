require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @course = courses(:programming)
    # request.host = 'http://attendence-system-missimi.c9users.io:8080'
  end
  
  test "can create sections" do 
    get :index
    # controller test does not let you use path?? only use symbol form. use rake routes to find it
    # get sections_path
    
    assert_template 'courses/index'
    assert_select "a[href=?]", root_url
    assert_select "a[href=?]", new_course_path
    assert_select "title", "Courses Home Page"
  end
end
