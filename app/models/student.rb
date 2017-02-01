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

  def self.search(sname)
    #@students = Student.all.find_all {|n| n.name.include?(sname)} 
    @students = []
    
    Student.all.each do |nom|
      if nom.name.downcase.include?(sname)
        @students << nom 
      end
    end
    @students
    #{|student| student.name.include? "arg" }
    #binding.pry
    #render 'index'

    #render partial: "students/student", locals: {student: @student} 
  end

  # Add in search functionality such that users can search 
  # for a student by name and see all matching results 
  #   on the students index page. The results should be 
  #   displayed by rendering a students/_student.html.erb partial.



end
