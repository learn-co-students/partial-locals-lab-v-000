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

  def self.search(s_name)
# binding.pry
    if s_name.blank?
      self.all
    else
      self.all.select{|s| s.name.include?(s_name.capitalize)}
    end
  end

end
