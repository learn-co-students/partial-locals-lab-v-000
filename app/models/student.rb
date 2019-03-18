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
end

def self.search(name)
  results == []
  if name == ""
    results = Student.all
  else
    Student.all.each do |student|
      if student.name.downcase.include?(name)
        results << student
      end
    end
  end
  resluts
end
end
