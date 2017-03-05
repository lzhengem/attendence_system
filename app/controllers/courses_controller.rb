class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    
    def new
        @course = Course.new
    end
    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:success] = "Course added!"
            redirect_to courses_path
        else
            render 'new'
        end
    end
    
    private
        def course_params
            params.require(:course).permit(:crn, :title, :section)
        end
end