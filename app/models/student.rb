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

# I need to create my search method here. What does search do?
# User puts something in to search and we return the student if they exist
# we return the full list of students if it doesn't

  def self.search(input)
    if input.empty?
      Student.all
    elsif input.present?
      Student.all.select {|s| s.name.downcase.match(input.downcase)}
    end
  end
end
