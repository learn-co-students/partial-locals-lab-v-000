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

  def self.search(name)
    @students = []
    Student.all.each do |student|
      if student.name.downcase.include?(name.downcase)
        @students << student 
      end
    end
    if @students == []
      @students = Student.all 
    end
    @students
  end
  
end
