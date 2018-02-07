
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  validates :name, presence: true
  validates :birthday, presence: true
  validates :hometown, presence: true

  def self.search(term)
  	if term.present?
  		where('name LIKE ?', "%#{term}%")
  	else
  		self.all
  	end 
  end 

end


# could be where ('name LIKE ?', OR hometown LIKE ?, etc. )