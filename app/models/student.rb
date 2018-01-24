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
  
  
  def self.search(string)
    array_of_students = Student.all.map {|s| s}
    array_of_students = array_of_students.delete_if {|student| !student.name.downcase.include?(string)}
    
    if array_of_students == []
      return Student.all
    else
      return array_of_students
    end
    
  end
  
  
end
