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

  def self.search (*arg)
    if  arg.first.empty?
      Student.all
    else
      #returns similar match to the argument passed
    Student.where('name like ? ', "%#{arg.first}%")
    end
  end

end
