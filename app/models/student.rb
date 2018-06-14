# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    if name.present?
    Student.where('name LIKE ?',
    "%#{name}%")
    else
      Student.all
    end
  #   students =
  #   Student.all.map do |student|
  #     binding.pry
  #     if student.name.include? "name"
  #        student.name
  #     end
  #   end
  #   Student.all if students = []
  #   end
  # end
  end
end
