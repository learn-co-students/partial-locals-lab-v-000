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
    if string == ""
      Student.all
    else
      matches = []
      Student.all.each do |s|
        if s.name.downcase.include? string.downcase
          matches << s
        end
      end
      matches
      # Check if there's a higher-level, more compact way of doing this matching. Maybe AR .where + regexp?
    end
  end

end
