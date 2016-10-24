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
    if !query.empty?
      selected_students = []
      self.all.each do |student|
        if student.name.include?(query.capitalize)
          selected_students << student
        end
      end
        selected_students
    else
      self.all
    end
  end

end
