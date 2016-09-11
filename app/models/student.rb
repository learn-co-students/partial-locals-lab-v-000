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

  def self.search(name)
    if name == ''
      return Student.all
    else
      name_array = []
      Student.all.each do |student|
        student_name = student.name.downcase
        if student_name.include? name
          name_array << student
        end
      end
      return name_array
    end
  end

end
