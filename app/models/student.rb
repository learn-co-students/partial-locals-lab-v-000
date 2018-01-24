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

  def self.search(arg)
    students = []
    if arg == ''
      Student.all.each do |s|
        s
      end
    else
      Student.all.each do |s|
        if s.name.match(/(?i)(#{arg})/)
          students << s
        end
      end
      students
    end
  end
end


# def self.search(query)
#     if query.present?
#       where('NAME like ?', "%#{query}%")
#     else
#       self.all
#     end
#   end
