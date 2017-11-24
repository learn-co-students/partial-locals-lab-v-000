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
    return self.all if term.empty?
    self.all.collect do |student|
      if student.name.downcase.include?(term.downcase)
        student
      end
    end.compact
  end
end
