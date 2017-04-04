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
            
            @course.add_section(section_params)
            flash[:success] = "Course added!"
            redirect_to courses_path
        else
            render 'new'
        end
    end
    
    def update
    end
    
    def show
        @course = Course.find_by(id: params[:id])
    end
    
    def destroy
        Course.find_by(id: params[:id]).destroy
        redirect_to courses_path
    end
    
    private
        def course_params
            params.require(:course).permit(:crn, :title)
        end
        
        #this is how many sections they would like to add
        def section_params
            params.require(:course).permit(:add_section)["add_section"]
        end
end
