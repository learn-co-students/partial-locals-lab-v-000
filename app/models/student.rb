class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student_name)
    if student_name != " "
      self.all.select {|student| student if student.name.match(student_name.capitalize)}
    else
      self.all
    end
  end
end
