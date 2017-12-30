class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search)
    if search.present?
      where('NAME like ?', "%#{search}%")
    else
      self.all
    end
  end
end
