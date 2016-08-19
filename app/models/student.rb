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
  validates :name, presence: true
  validates :hometown, presence: true
  validates :birthday, presence: true

  def self.search(name)
    if name == ""
      Student.all
    else
      matching_students = []
      Student.all.map do |student|
        student_name = student.name.downcase
        if student_name.match(name.downcase)
          matching_students << student
        end
      end
      matching_students
    end
  end
end
