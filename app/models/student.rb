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
      temp = self.all
    else
      temp = self.all.collect do |student|
binding.pry
        if student.name && student.name.upcase.include?(query.upcase)
          student
        end
      end
# binding.pry
    end
  end
  
end
