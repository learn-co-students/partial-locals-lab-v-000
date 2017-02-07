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
    results = []
    if term == ""
      results = self.all
    else
      dterm = term.downcase
      self.all.each do |student|
        results << student if student.name.downcase.include?(dterm)
      end
    end
    results
  end
end
