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
  require 'pry'
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student)
    if student == ""
      self.all
    else
      self.all.find_all {|s| s.name.include?(student[0].upcase) }
    end
  end
end
