
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)

    if name.empty?
      @students = Student.all
    else
       @students = Student.all.select {|student| student.name.include?(name.capitalize)}
     end
     @students
  end
end

#
# Add in search functionality such that users can search for a student by name and see all matching results
#  on the students index page. The results should be displayed by rendering a students/_student.html.erb partial.
