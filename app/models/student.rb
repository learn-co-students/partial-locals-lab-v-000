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

  def self.search(search)
    @results = []
    if search.blank?
      @results = Student.all
    else
      Student.all.each do |student|
        @results << student if student.name.downcase.match(search.downcase)
      end
    end
    @results
  end

end
