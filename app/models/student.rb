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

  def self.search(term)
    if term.present?
      students = []
      students = Student.all.select do |student|
        student.name.downcase.include? term
      end
      if students == nil || students == []
        students = Student.all
      end
      students
    else
      Student.all
    end
  end
end
