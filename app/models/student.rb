class Student < ActiveRecord::Base
    has_many :rosters
    has_many :courses, through: :rosters
end
