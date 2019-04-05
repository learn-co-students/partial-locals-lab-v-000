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
#binding.pry
    if query == ""
      Student.all
    else
      array = []
      Student.all.each do |student|
      #  binding.pry
        if student.name.downcase.include?(query)
          array << student
        end
      end
      #binding.pry
      array
    end

  end

end
