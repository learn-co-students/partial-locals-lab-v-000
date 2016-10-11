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
    answer =  Student.find_by_sql("SELECT * FROM Students WHERE Name LIKE '%#{name}%'")
    if name != nil
      answer
    else
      Student.all
    end
  end

end
