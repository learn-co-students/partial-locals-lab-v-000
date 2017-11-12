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

  @@results = []

  def self.search(query)
  	self.search_results = self.all.select { |student| student.name.downcase.include?(query) }
  	# byebug
  	if self.search_results.empty?
  		self.search_results = self.all 
  	end

  	self.search_results
	end

	def self.search_results=(results)
		@@results = results
	end

	def self.search_results
		@@results
	end


end


