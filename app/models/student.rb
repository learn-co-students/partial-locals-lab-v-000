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

  def self.search(student_search)
  	if student_search.present?
  		where("name LIKE ?", "%#{student_search}%")

  		else student_search.empty?
  		self.all
   
  		end
  	end

end
