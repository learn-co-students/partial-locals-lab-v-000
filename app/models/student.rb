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
    students_array = []
    Student.all.each do |student|
      if !!/#{name}/i.match(student.name)
        students_array << student
      end
    end
    students_array
  end
end
