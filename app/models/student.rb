class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    self.all.select {|student| student.name.downcase.include?(name.downcase)} if name
  end
end
