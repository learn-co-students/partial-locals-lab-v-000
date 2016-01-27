class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    if name.present?
      all.collect do |student|
        student if student.name.downcase.include?(name)
      end.compact
    else
      self.all
    end
  end
end
