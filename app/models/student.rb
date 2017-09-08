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
require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  def self.search(student)
    @student_array = []
    @students = Student.all
    @students.each do |stud|
      if stud.name.include?(student)
        @student_array << stud
      end
    end
    return @student_array
  end
end
