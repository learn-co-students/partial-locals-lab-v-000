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

  def self.search(arg)
    @ary = Student.all.find(arg) {|student| student.name.include? "arg" }

    #render partial: "students/student", locals: {student: @student} 
  end

end
