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
    if query.blank?
      self.all #show all students
    else
      self.all.select do |student|
        if student.name.include?(query.capitalize)
          student.name
        end
      end
    end
  end
end
