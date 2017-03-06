class StudentsController < ApplicationController
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:success] = "Student created!"
            redirect_to students_url
        else
            render 'students/new'
        end
    end
    
    def show
    end
    
    def destroy
    end
    
    private
        def student_params
            params.require(:student).permit(:last_name,:first_name)
        end
end
