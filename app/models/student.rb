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

  def self.search(str)
    student_arr = Student.all.map{|student| student}
    searched_arr = student_arr.delete_if {|student| !student.name.downcase.include?(str)}

    return searched_arr == [] ? student_arr : searched_arr
  end

end
