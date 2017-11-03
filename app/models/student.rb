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
    if name.empty?
      Student.all
    else
      Student.all.select do |student|
        /#{name}/i.match(student.name)
      end
    end
  end

  # def self.search(query)
  #   if query.present?
  #     where('NAME like ?', "%#{query}%")
  #   else
  #     self.all
  #   end
  # end

end
