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

  def self.search(n)
    students = []
    if !n.empty?
      Student.all.each {|s|
        if s.name.downcase.include?(n.downcase)
          students << s
        end
      }
    end
    # Student.where(name: name)
    students.empty? ? Student.all : students
  end
end
