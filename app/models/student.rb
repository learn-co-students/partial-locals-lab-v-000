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

  def self.search(search_name)
    search_name = search_name.downcase
    array = []
      if search_name != ''
        self.all.each do |student|
          if student.name.downcase.include?(search_name)
            array << student
          end
        end
        array
      else
        self.all
      end
    end



end
