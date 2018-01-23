class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(term)
    if term.present?
      where("name LIKE ?", "%#{term}%")
    else
      self.all
    end
  end
end
