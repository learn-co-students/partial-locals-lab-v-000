class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(var)
    self.all.select { |student| student.name.downcase.match(var.downcase) }
  end
  
end