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

  # def self.search(n)
  #   Student.all.map do |student|
  #     if student.name.downcase.include?(n.downcase)
  #       student.name
  #     elsif n == ""
  #       Student.all
  #     end
  #   end
  # end

  # def self.search(query)
  #   # Student.all.select do |student|
  #   #   student.name.downcase.include?(searched_name.downcase)
  #   #
  #   # end
  #   # if searched_name.empty?
  #   #   return Student.all
  #   # end
  # end

  def self.search(query)
   return Student.all if query.empty?
   search_results = Student.all.select {|student| student.name.downcase.include?(query.downcase)}
  end
end
