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

# search function user can search for a student by name
# when it receives an empty search argumelnt returns all students
# when it receives an argument returns all students names whose name contains the given string
# and see all matchign results on the students index page
# rendered using the student partial

  def self.search(student_name = Student.all)
    if student_name.blank?
      Student.all
    else
      students = []
      Student.all.each do |s|
        if s.name.downcase.include?(student_name)
          students << s
        end
      end
        students

    end
  end

end
