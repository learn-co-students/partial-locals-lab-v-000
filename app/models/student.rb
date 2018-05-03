class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student)
    if student.present?
      where('NAME like ?', "%#{student}%")
    else
      self.all
    end
  end
end
