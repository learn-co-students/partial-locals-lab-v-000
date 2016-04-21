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

  def self.search(query)
    if query.present?
      #if search term provided
      self.all.select do |student|
        student.name.downcase.include?(query)
      end
    else
      #if no search term provided
      self.all
    end
  end
 
end
