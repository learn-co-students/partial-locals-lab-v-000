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
  
  def self.search(query) 
    search_result = []
    Student.all.each do |student|
      if student.name.downcase.include?(query)
        search_result << student 
      end 
    end 
    
    
    #binding.pry
    if search_result == [] 
      return Student.all
    else 
      return search_result
    end 
  end 
  
end
