
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  def self.search(input)
  if input
    where('name LIKE ?', "%#{input}%")
  else
    all
  end
end
end
