class Course < ActiveRecord::Base
    validates :crn, presence: true, uniqueness: true
end
