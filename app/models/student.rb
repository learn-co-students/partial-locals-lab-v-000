
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  def self.search(term)
  	if term 
  		where('name LIKE ?', "%#{term}%")
  	else
  		all
  	end 
end

