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
    @student = []
    if !student.empty?
      @student = self.all.select {|person| person.name.downcase.include?(student.downcase)}
    else
      @student = self.all
    end
  end
end
