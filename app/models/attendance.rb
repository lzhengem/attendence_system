class Attendance < ActiveRecord::Base
    # attr_accessor :state
    belongs_to :student
    belongs_to :session
end
