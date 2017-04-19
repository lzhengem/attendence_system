class SessionsController < ApplicationController
    def new
        
        @section = Section.find_by(id: params[:section])
        #either it has a new one or create a new one
        @session = @section.sessions.find_by(date: params[:date]) || @section.sessions.create(date: params[:date])
        
        #if there is no attandance or there are students missing in the attendance, update it
        @session.initialize_student_attendance(@session.students.ids)
        redirect_to edit_session_path(@session)
    end
    
    def edit
        @session = Session.find_by(id: params[:id])
        @attendances = @session.attendances
    end
    
    def update
        @session = Session.find_by(id: params[:id])
        #reject the empty ids
        present_student_ids = session_params[:student_ids].reject{|id| id.to_i.zero?} || []
        
        @session.update_student_attendance(present_student_ids)
        redirect_to edit_session_path(@session)
    end
    
    # def create
    #     @section=Section.find(session_params[:section_id])
    #     # if the session already exists, then overwrite it
    #     # @session = @section.sessions.find_by(date: session_params[:date])
        
    #     #destroy the old session if it exists
    #     if @old_section = @section.sessions.find_by(date: session_params[:date])
    #         @old_section.destroy
    #     end
    #     # need to generate section and student records
    #     @session = @section.sessions.build(date: session_params[:date])
    #     if @session.save
    #         #save student attendance
    #         @session.add_student_attendance(session_params[:student_ids])
    #         redirect_to session_path(@session)
    #     end
        
    # end
    
    def show
        @session = Session.find(params[:id])
        @attendances = @session.attendances
    end
    
    private
        def session_params
            params.require(:session).permit(:date,:section_id,:student_ids=>[])
            
        end
end
