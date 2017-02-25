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

  def self.search(search_value)
  	if search_value.blank?
  		Student.all
  	else
        Student.all.collect do |student|
  			student if student.name.downcase.include?(search_value.downcase)
  		end.compact
  	end
  end
end
