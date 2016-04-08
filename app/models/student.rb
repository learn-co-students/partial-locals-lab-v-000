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

  def self.search(nickname)
    # match the nickname
    if nickname == ''
      Student.all
    else
      Student.all.select do |s|
        s.name =~ /Rob/
      end
    end
  end
end
