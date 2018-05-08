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
    if name == "" || name.nil?
      return Student.all 
    else 
      Student.all.find_all do |student|
        student.name.include?(name.capitalize)
      end #each iterator    
    end 
  end #search method

  # returns all students whose names contain the given string

end
