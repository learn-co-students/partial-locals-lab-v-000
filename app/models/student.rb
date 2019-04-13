require "pry"
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
       if student.include?(student)
        where("name LIKE ?", "%#{student}%")
         else student.include?("") 
          self.all
        end
    end

end
