class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    if name.present?
      self.where("name LIKE ?", "%#{name}%")
      # self.all.select { |student| student.name.downcase.include?(name) }
    else
      self.all
    end
  end

end
