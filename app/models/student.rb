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
    if string == ""
      self.all
    else
      found_students = []
      self.all.each do |student|
        if student.name.downcase.include? string
          found_students << student
        end
      end
      found_students  
    end
  end
end
