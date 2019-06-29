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

  # def self.search(name_query)
  #   Student.all.select { |student| student.name.include?(name_query) }
  # end

  def self.search(student_name)
    if student_name.blank?
      all
    else
      where('name LIKE?', "%#{student_name}%")
    end
  end
end
