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
    @return = []

    Student.all.each do |s|
      if s.name.downcase.include?(string.downcase) && string.size > 0
        @return << s
      end
    end

    if @return.size > 0
      @return
    else
      Student.all.map{|s| s}
    end
  end

end
