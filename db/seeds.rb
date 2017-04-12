# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
course = Course.create(crn: 111, title: 'Magic')
course.add_section(5)
section = course.sections.first

# create students
Student.create([{first_name: 'Sakura', last_name: 'Kinomoto'},
                {first_name: 'Shaoran', last_name: 'Li'},
                {first_name: 'Kero', last_name: 'Chan'},
                {first_name: 'Tomoyo', last_name: 'Daidouji'},
                {first_name: 'Meiling', last_name: 'Rae'}
                ])
                
# put 3 students in first section of course
Student.take(3).each do |student|
    section.students << student
end