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

  def self.search(student_name=nil)
    if !student_name
      self.all
    else
      students = []
      self.all.map{|s| students << s if s.name.downcase.include?(student_name)}
      students
    end
  end

end
