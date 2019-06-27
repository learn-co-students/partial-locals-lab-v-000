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
  def Student.search(name)
    matches = []
    Student.all.each do |s|
      if s.name.downcase.include? name
        matches << s
      end
    end
    if matches.empty?
      Student.all
    else
      matches
    end
  end
end
