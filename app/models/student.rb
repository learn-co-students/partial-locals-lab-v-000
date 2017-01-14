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
    name_array = []
    if string == ""
      all
    else
      all.each do |student|
        if student.name.downcase.include?(string)
          name_array << student
        end
      end
      name_array
    end
  end









end
