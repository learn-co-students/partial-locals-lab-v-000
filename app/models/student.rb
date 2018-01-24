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
  	if student == nil
  		Student.all
  	else 
      Student.all.select do |s|
        s.name.match(student.capitalize)
      end 
  	end
  end

  def self.match(student)
  		student = student.capitalize
 		@match = []
 		Student.all.map do |s|
  			@match << s if s.name.match(student)
  		end
  		@match
  end
end
