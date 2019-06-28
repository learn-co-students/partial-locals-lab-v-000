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

  def self.search(query)
    if query == ''
      Student.all
    else
    #  binding.pry
      #Student.all.select { |student|  student.name.downcase.include?(string.downcase)}
      where('NAME like ?', "%#{query}%")
    end
  end

end
