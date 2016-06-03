class Classroom < ActiveRecord::Base
  has_many :classroom_students
  has_many :students, through: :classroom_students

  def oldest_student
    students.where("birthday is not null").order("birthday asc").first
  end
end
