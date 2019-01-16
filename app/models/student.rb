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
    @students = []
    if student.blank?
      Student.all.each do |st|
        @students << st
      end
    else
      Student.all.each do |s|
        if s.name.downcase.include? student
          @students << s
        end
      end
      @students
    end
  end

end




#if my_string.include? "cde"
