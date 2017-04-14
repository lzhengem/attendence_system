class Session < ActiveRecord::Base
  belongs_to :section
  has_many :attendances
  has_many :students, through: :attendances
  # attr_accessor :date
end
