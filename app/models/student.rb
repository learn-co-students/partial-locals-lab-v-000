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

  def self.search(student_name)
    if student_name.empty?
      Student.all
    else
      found_student = Student.where("name = student_name")
    end
  end

      #if search is empty
      #return all students
      #else
      #return specific student


    end
  end

end
