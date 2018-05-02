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

  def self.search(student)
    if student.present?
      Student.where("name like ?", "%#{student}%")
    else
      Student.all
    end
  end

  def self.oldest_student
    Student.where("birthday is not null").order("birthday asc").first
  end
end
