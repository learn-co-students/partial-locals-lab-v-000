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

  def self.search(term)
    if term
      array = []
      Student.all.each do |s|
        if s.name.downcase.include?(term)
          array << s
        end
      end
      array
    else
      Student.all
    end
  end
end
