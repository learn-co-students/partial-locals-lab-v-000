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

    def self.search(query)
        student_names = []
        if query
            Student.all.each do |student|
                if student.name.match(/#{query}/i)
                    student_names << student
                end #if
            end #do
        else
            student_names = Student.all
        end
         student_names
    end

end

