require 'pry'
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
    if student_name == ''
      Student.all.each do |student|
      end
    else
      Student.all.select {|student| student.name.downcase.include? student_name.downcase}
      #https://apidock.com/ruby/Array/include%3F originally was start_with? but changed to include because of isaac's suggestion
    end
  end
end
