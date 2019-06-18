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

  def self.search(search_string)
    array = []
    if search_string == ""
      self.all.each do |student|
        array << student
      end
    else
      self.all.each do |student|
        if /#{search_string}/.match(student.name.downcase)
          array << student
        end
      end
    end
    array
  end

end
