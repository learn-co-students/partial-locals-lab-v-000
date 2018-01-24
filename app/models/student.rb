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

  def self.search(user_search)
    if user_search.present?
        self.all.collect do |student|
            student if student.name.downcase.include?(user_search.downcase)
        end.compact
    else
        self.all
    end
  end

end
