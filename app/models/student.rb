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


  def self.search(name_to_search)

    matches = Student.all.select do |student|
      student.name.downcase.include?(name_to_search)
    end

    # student is found return all students whose name contains the given string
    if !matches.empty?
      matches
    else
      # returns all students
      Student.all
    end

  end

end
