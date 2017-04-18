class SessionsController < ApplicationController
    def new
        
        @section = Section.find_by(id: params[:section])
        @session = Session.new
        # @session = @section.sessions.find_by(date: params[:date]) || Session.new
    end
    
    def create
        @section=Section.find(session_params[:section_id])
        # if the session already exists, then overwrite it
        # @session = @section.sessions.find_by(date: session_params[:date])
        
        # need to generate section and student records
        @session = @section.sessions.build(date: session_params[:date])
        if @session.save
            #save student attendance
            @session.add_student_attendance(session_params[:student_ids])
            redirect_to session_path(@session)
        end
        
    end
    
    def show
        @session = Session.find(params[:id])
    end
    
    private
        def session_params
            params.require(:session).permit(:date,:section_id,:student_ids=>[])
        end
end
