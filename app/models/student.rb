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

require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student_name = nil)
    search_results = []
    if student_name == nil
      Student.all
    else
      Student.all.each do |s|
        if s.name.downcase.include?(student_name)
          search_results << s
        end
      end
      search_results
    end
  end

end
