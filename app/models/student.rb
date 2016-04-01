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

  def self.search(search_term = "")
    if search_term.empty?
      self.all
    else
      self.all.find_all do |student|
        student.name.downcase.include?(search_term.downcase)
      end
    end
  end

end
