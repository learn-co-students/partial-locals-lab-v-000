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
    # binding.pry
    if student.empty?
      self.all
    else
      self.all.map do |s|
          if s.name.match((student.capitalize)) || s.name.match((student))
            s
          end
      end.compact #do

    end #if

  end #method
end #class
