class Student < ActiveRecord::Base
    has_many :section_students, dependent: :destroy #this table is to maintain the has_and_belongs_to_many relationship
    has_many :sections, through: :section_students
    has_many :courses, -> { distinct }, through: :sections
    has_many :attendances, dependent: :destroy
    has_many :sessions, through: :attendances
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    before_save :capitalize_name
    
    def full_name
        "#{first_name} #{last_name}"
    end
    
    def capitalize_name
        self.first_name.capitalize!
        self.last_name.capitalize!
    end
    
    
end
