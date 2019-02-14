

class Student < ActiveRecord::Base
  
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  def self.search(query)
    if query.present?
      where('name like :query', query: "%#{query}%")
    else
      self.all
    end
  end
  
end
