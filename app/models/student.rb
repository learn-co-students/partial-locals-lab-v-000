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

  def self.search(student_name)
    if student_name.empty?
      self.all.each do |student|
        student.name
      end
    else
      self.all.select{|student| student.name.downcase.include?(student_name)}
    end
  end

end
