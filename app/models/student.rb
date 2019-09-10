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

  def self.search(string)
    @students = self.all
    if string.empty?
      @students
    else
      @students.select {|s| s.name.include?(string) or s.name.include?(string.capitalize)  }
    end
  end

end
