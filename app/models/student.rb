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

require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  #
  # def search(name)
  #   students = Student.all
  #   students.each do |student|
  #     if student.name.include? "#{name}"
  #       student
  #     else
  #       self.all
  #     end
  #   end
  # end

  def self.search(term)
    students = Student.all
    if !term.empty?
      students.select{|student| student.name.downcase.include? "#{term.downcase}"}
    else
      self.all
    end
  end

end
