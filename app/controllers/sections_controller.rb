class SectionsController < ApplicationController
    
    
    def show
        @section = Section.find_by(id: params[:id])
    end
    
    def edit
        @section = Section.find_by(id: params[:id])
    end
    
    def update
        # add multiple students to the section
        @section = Section.find_by(id: params[:id])

        
        @section.add_students(not_enrolled)
        @section.remove_students(enrolled)
        # flash['danger'] = not_enrolled
        # flash['danger'] = enrolled
        
        redirect_to @section
    end
    
    private
        def not_enrolled
            params.require(:section).permit(student_ids:[])
        end
        def enrolled
            params.require(:section).permit(students:[])
        end
    
end
