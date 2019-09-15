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
    if term.empty?
      result = self.all
    else
      result = []
      self.all.each do |student|
        result << student if student.name.downcase.include?(term.downcase)
      end
    end
    result
  end
end
