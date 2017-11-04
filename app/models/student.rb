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
    #binding.pry
    finds = []

   Student.all.map do |s|
      if s.name.include?(name.capitalize)
        finds << s
      end
   end
    
   finds
end



end
