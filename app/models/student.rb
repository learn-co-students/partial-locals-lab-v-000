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

  def self.search(name)
    student_array = []

    if name.blank?
      student_array = self.all
    else
      #student_array =  self.all.collect {|x| x.name.downcase}.reject {|x| !x.include?(name)}
      student_array = self.all.reject{|x| !x.name.downcase.include?(name.downcase)}
    end
    #binding.pry
    student_array
  end

end
