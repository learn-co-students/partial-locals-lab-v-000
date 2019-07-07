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

  def self.search(student_string)
    soft_matches = []
    if student_string != ""
      self.all.each do |student|
        if student.name.downcase.include?(student_string.downcase)
          soft_matches << student
        end
      end
      soft_matches
    else
      self.all
    end
  end
end
