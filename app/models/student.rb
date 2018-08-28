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
    
    if query.empty?
      self.all
    else
      temp = self.all.collect do |student|
        if student.name && student.name.include?(query)
          student
        end
      end
    end
    
    binding.pry 
  end
  
end
