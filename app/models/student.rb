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

  def self.search(query_string)
  	if query_string == ''
  		self.all
    else 
    	self.all.select {|student| student.name.downcase.include?(query_string.downcase)}
    end
  end
end
